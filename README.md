TP 1 : Fondamentaux de Git

Objectif général
Mettre en pratique l’ensemble des concepts fondamentaux de Git avant d’aborder les workflows collaboratifs.

Objectifs pédagogiques
À la fin de ce TP, l’étudiant sera capable de :
Initialiser et manipuler un dépôt Git local  
Comprendre les zones de Git (Working Directory, Staging Area, Repository)  
Créer des commits cohérents et professionnels  
Explorer l’historique et les snapshots  
Manipuler les fichiers (ajout, suppression, renommage, restauration)  
Diagnostiquer des erreurs courantes  
Utiliser git diff, git log, git restore, git rm, git mv  
Comprendre le modèle snapshot et l’architecture interne de Git  
Utiliser git bisect pour identifier un commit fautif  

Exercice 1: Initialisation d’un dépôt Git

1.1 Actions
Créer un dossier nommé tp-session1-git.  
Se placer dans ce dossier via le terminal.  
Initialiser un dépôt Git.  
Vérifier l’état du dépôt.

1.2 Livrables
Commandes utilisées  
Sortie de git status

Exercice 2: Zones de Git: Working Directory (WD), Staging, Repository

2.1 Actions
Créer un fichier notes.txt contenant : 


Git est un système de gestion de versions distribué.


 Vérifier l’état du dépôt.  
Ajouter le fichier au staging.  
Vérifier à nouveau l’état.  
Faire un commit avec un message clair et professionnel.

2.2 Livrables
Commandes  
Message de commit

Exercice 3: Modifications, diffs et commits

3.1 Actions
Ajouter une deuxième ligne à notes.txt :  


Il utilise un modèle basé sur des snapshots.


Afficher les différences entre WD et staging.  
Ajouter la modification au staging.  
Afficher les différences entre staging et repository.  
Faire un commit.

3.2 Livrables
Sortie de git diff  
Sortie de git diff --staged

Exercice 4: Historique et navigation

4.1 Actions
Afficher l’historique complet.  
Afficher l’historique en mode compact.  
Afficher l’historique sous forme de graphe.

4.2 Livrables
Sortie de git log --oneline --graph --decorate
Exercice 5: Restauration de fichiers

5.1 Actions
Supprimer la première ligne de notes.txt.  
Sans faire un commit,, restaurer le fichier à l’état du dernier commit.  
Vérifier que la restauration a fonctionné.  
Expliquer la différence entre git restore et git checkout.

5.2 Livrables
Commandes  
Explication
Exercice 6: Suppression et renommage

6.1 Actions
Créer un fichier draft.txt..  
L'ajouter au staging et faire un commit.  
Le supprimer avec Git.  
Renommer notes.txt en git-notes.txt.  
Faire un commit  des changements.  
Expliquer pourquoi git rm est préférable à rm.

6.2 Livrables
Commandes  
Explication
Exercice 7: Comprendre les snapshots Git

7.1 Actions
Afficher le hash du dernier commit.  
Lister le contenu du snapshot avec : 


git ls-tree -r <hash>


Explique ce qu’est un snapshot dans Git.

7.2 Livrables
Sortie de git ls-tree 
Explication

Exercice 8: Débogage avec git bisect (simulation)

8.1 Actions
Créer un fichier version.txt contenant :


version 1


 
Faire un commit.  
Créer 5 nouveaux commits en incrémentant la version (2 → 6).  
Introduire un bug dans la version 4 en ajoutant : 


BUG


 Utiliser git bisect pour identifier le commit fautif.  
Noter le commit trouvé.

8.2 Livrables
Commandes bisect  
Commit fautif identifié
