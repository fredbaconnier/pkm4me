# GIT Workflow

jeu. 03 févr. 2022 21:30:05 CET

Le workflow a pour vocation de décrire comment je fais évoluer mon 
projet avec les repo git. 
Ici, la question est de savoir comment j'utilise les différents répo, 
  celui de git, 
  celui de mon _worktree_ 
  et celui de partage local si je souhaite développer des features
  sans toucher directement à mon _worktree_ principal. 

L'autre question découle de ce dernier point : comment j'utilise les 
branches et  comment je sépare mes commits par feature en particulier 
quand je travaille sur plusieurs features en même temps. On va le voir, 
      est-ce que je fais une branche nouvelle par feature ? 

## idée de maneuvre

Deux cas de figures se posent : 
1. je pars de rien 
2. je clone un repo existant 

### Nouveau projet (partant de rien) 

- Je crée un répertoire projet `prj/superproj`
- `[~/prj/superproj] git init` 
- Je crée un repo de partage dans `~/repo`
-`[~/repo] git init --base superproj.git` 

Ensuite, voir [commit des features](#features)

### Récupération d'un projet existant 

C'est le scénario du clonage qui sera `origin`. Ma proposition est de faire un
clone `--base` du repo (_remote_) github et de cloner (une deuxième fois) ce repo _local_.
C'est ce deuxième clone qui sera mon _worktree_ et qui aura pour origine le
repo _local_. 

%TODO% Faire un schéma 

Le développement consiste ensuite à travailler exclusivement sur le `worktree`, 
   à commiter les changements régulièrement dans des branches dédiées 
   conformément à la [convention](git.message.md).
Quand une branche est prête à être partagée, je la la merge dans 
  le master de mon _worktree_ (je crois que ce sera alors un rebase).
Ensuite je la pousse 
  dans le repo _local_. 
C'est le repo _local_ qui me sert à partager dans le LAN 
mes branches proposées comme finies. 

Enfin, quand je suis ok, je push vers github. C'est là que je ne suis pas 
sûr de moi. Puis-je le faire depuis mon repo _local_ ou bien 
dois-je le faire depuis mon _worktree_ en branche `master` ? 

%TODO% vérifier si je peux faire un push depuis mon repo _local_

