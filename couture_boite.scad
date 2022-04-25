// tiroir.scad
// mer. 20 avril 2022 16:27:03 CEST
// caractéritique de la boite englobante
/////////////////////////////////////////
NbCol = 2; // NbCol tiroirs accolés = c'est le nb de colonne de tiroirs
NbLin = 3; // NbLin tiroirs superposés = c'est le nb de ligne de tiroirs
NbCaz = 4; // Nbcaz nombre de cases dans le tiroir 
// Lx= 290;   // Longeur hors tout (de face)
Lx= 311;   // Longeur hors tout (de face)
Ly= 249;   // Profondeur hors tout (largeur vue de dessus) 
Hz= 156;   // Hauteur du bloc hors tout 
Ep=   6;   // épaisseur des cloisons du bloc
j =   2;   // jeu autour de chaque face du tiroir (2 pour tissus, sinon 1.5)  
Tp=   5;   // épaisseur des cloisons de tiroirs

// ne pas toucher
delta= 1;  // dépassement pour les différences


// Affichage des caractéristiques
/////////////////////////////////
echo("Hors Tout Externes");
echo(Lx=Lx, Ly=Ly, Hz=Hz);

// Calcul de chaque case pour tiroir 
////////////////////////////////////
Lxi= (Lx - (NbCol+1)*Ep)/NbCol;
Hzi= (Hz - (NbLin+1)*Ep)/NbLin;
echo("Cotes Interieures");
echo(Lxi=Lxi, NbCol=NbCol);
echo(Hzi=Hzi, NbLin=NbLin);

// Calcul de chaque tiroir 
//////////////////////////
Tx= Lxi-2*j;
Ty= Ly-Ep-3*j;
Tz= Hzi -2*j;
echo("Cotes 'Tiroir' Extérieures");
echo(Tx=Tx, Ty=Ty, Tz=Tz);
Txi= Tx-2*Tp;
Tyi= Ty-2*Tp;
Tzi= Tz-Tp;
echo("Cotes 'Tiroir' Intérieures");
echo(Txi=Txi, Tyi=Tyi, Tzi=Tzi);
Tycase= (Tyi -(NbCaz-1)*Tp)/NbCaz;
echo(Tycase=Tycase);

bexterne();
tiroirs(); 

// module tiroirs
/////////////////
module tiroirs(){
  for(i=[1:NbCol]){
    for(k=[1:NbLin]){
      if((k!=NbLin)||(i!=NbCol)){      
         translate([Ep+j+(i-1)*(Ep+Tx+2*j),
                   -(NbCol-i)*(NbLin-k)*Ty/(NbCol*NbLin),
                   Ep+j+(k-1)*(Ep+Tz+2*j)])
         tiroir();
      }
    }
  }
}

// module tiroir
////////////////
module tiroir(){
  difference(){
    cube([Tx,Ty,Tz]);
	for(i=[1:NbCaz]){
	  // translate([Tp,Tp,Tp]) cube([Txi,Tyi,Tzi+delta]);
	  translate([Tp,Tp+(NbCaz-i)*(Tp+Tycase),Tp]) cube([Txi,Tycase,Tzi+delta]);
	  }
  }
}

// module boite externe
///////////////////////
module bexterne(){
  difference(){
    cube([Lx,Ly,Hz]);
    for(i=[1:NbCol]){
      for(k=[1:NbLin]){
        translate([Ep+(i-1)*(Ep+Lxi),-delta,Ep+(k-1)*(Ep+Hzi)])
        cube([Lxi,Ly-Ep+delta,Hzi]);
      }
    }
  } 
}
