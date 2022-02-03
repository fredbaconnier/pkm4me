# Workflow

## idée de maneuvre

Deux cas de figures se posent : 
1. je pars de rien 
2. je clone un repo existant 

### Nouveau projet (partant de rien) 

### Récupération d'un projet existant 

C'est le scénario du clonage qui sera `origin`. Ma proposition est de faire un
clone `--base`` du repo _remote_ github et de cloner (deuxième fois) ce repo _local_.
C'est ce deuxième clone qui sera mon `worktree` et qui aura pour origine le
repo _local_. 

%TODO% Faire un schéma 

Le développement consiste ensuite à travailler exclusivement sur le `worktree`, 
   à commiter les changements régulièrement dans des branches dédiées 
   conformément à la [convention](git.message.md)
  et quand une branche est prête à être partagée, à la merger dans 
  le master (je crois que ce sera alors un rebase) et le pousser
  dans le repo _local_. 
C'est depuis ce repo _local_ que l'on push et pull vers github. 



