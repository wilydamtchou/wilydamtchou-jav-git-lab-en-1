#!/usr/bin/env bash

###############################################################################
# TP1 UCC 131-1 : Fondamentaux de Git
# Script corrigé et commenté
###############################################################################

###############################################################################
# PRÉPARATION DU TP
###############################################################################

# On supprime un éventuel ancien répertoire pour repartir d'un contexte propre.
rm -rf tp-session1-git

###############################################################################
# EXERCICE 1 : Initialisation d’un dépôt Git
###############################################################################
echo "===================="
echo "EXERCICE 1 : Initialisation du dépôt"
echo "===================="

# Création du dossier du TP
mkdir tp-session1-git
cd tp-session1-git

# Initialisation du dépôt Git
git init

# Vérification de l’état du dépôt (aucun commit, aucun fichier suivi)
git status


###############################################################################
# EXERCICE 2 : Zones de Git (Working Directory, Staging, Repository)
###############################################################################
echo
echo "===================="
echo "EXERCICE 2 : WD / STAGING / REPOSITORY"
echo "===================="

# 1. Création d’un fichier dans le Working Directory
#    - WD : fichier présent sur le disque, non encore suivi par Git.
echo "Git est un système de gestion de versions distribué." > notes.txt

# 2. git status : on voit 'notes.txt' comme fichier non suivi (untracked)
git status

# 3. git add : passage de notes.txt dans la Staging Area (index)
git add notes.txt

# 4. git status : on voit 'notes.txt' dans la zone de staging (prêt à être commité)
git status

# 5. git commit : enregistrement dans le Repository
#    - Création d’un snapshot (commit) de notes.txt
git commit -m "Ajout du fichier notes.txt : définition de Git"


###############################################################################
# EXERCICE 3 : Modifications, diffs et commits
###############################################################################
echo
echo "===================="
echo "EXERCICE 3 : Modifications, diffs et commits"
echo "===================="

# 1. Modification du fichier : ajout d’une nouvelle ligne (Working Directory modifié)
echo "Il utilise un modèle basé sur des snapshots." >> notes.txt

# 2. git diff : comparer Working Directory (modifié) et Staging Area (ancienne version)
git diff

# 3. git add : on ajoute les modifications dans la Staging Area
git add notes.txt

# 4. git diff --staged : comparer Staging Area et HEAD (dernier commit)
git diff --staged

# 5. git commit : création d’un nouveau snapshot intégrant la nouvelle ligne
git commit -m "Ajout d'une explication sur le modèle snapshot"


###############################################################################
# EXERCICE 4 : Historique et navigation
###############################################################################
echo
echo "===================="
echo "EXERCICE 4 : Historique Git"
echo "===================="

# 1. git log : historique détaillé (hash, auteur, date, message)
git log

# 2. git log --oneline : historique condensé en une ligne par commit
git log --oneline

# 3. git log --oneline --graph --decorate --all :
#    - --graph : représentation en ASCII du graphe des commits
#    - --decorate : afficher les noms des branches/tags
#    - --all : afficher toutes les références
git log --oneline --graph --decorate --all


###############################################################################
# EXERCICE 5 : Restauration de fichiers (git restore vs git checkout)
###############################################################################
echo
echo "===================="
echo "EXERCICE 5 : Restauration de fichiers"
echo "===================="

# 1. On simule une mauvaise manipulation dans le Working Directory
#    Exemple : suppression de la première ligne (comme si on l’avait fait dans un éditeur)
#    Ici, on remplace le contenu par seulement la deuxième phrase.
echo "Il utilise un modèle basé sur des snapshots." > notes.txt

# À ce stade, le WD ne correspond plus au dernier commit.
git status

# 2. git restore : restaurer le fichier dans l’état du dernier commit (HEAD)
git restore notes.txt

# 3. Après restore, le fichier notes.txt revient à son état validé dans le Repository.
git status

# COMMENTAIRE PÉDAGOGIQUE :
# - git restore : commande moderne, explicite, pour restaurer des fichiers.
# - git checkout : sert principalement à changer de branche; son usage pour restaurer
#   des fichiers est ancien et moins clair. On préfère git restore pour la pédagogie.


###############################################################################
# EXERCICE 6 : Suppression et renommage (git rm, git mv)
###############################################################################
echo
echo "===================="
echo "EXERCICE 6 : Suppression et renommage"
echo "===================="

# 1. Création d’un fichier 'draft.txt'
echo "brouillon" > draft.txt

# 2. On l’ajoute au suivi Git
git add draft.txt
git commit -m "Ajout du fichier draft.txt"

# 3. Suppression avec git rm
#    - Supprime le fichier du WD
#    - Enregistre la suppression dans l’index (Staging Area)
git rm draft.txt

# 4. On commit cette suppression
git commit -m "Suppression du fichier draft.txt"

# COMMENTAIRE :
# - git rm : supprime le fichier ET l’enregistre comme suppression pour le prochain commit.
# - rm seul : supprime le fichier physiquement, mais Git le verra comme « deleted but not staged ».

# 5. Renommage de notes.txt en git-notes.txt avec git mv
#    - git mv fait l’équivalent d’un mv + git add + git rm adapté
git mv notes.txt git-notes.txt

# 6. Commit du renommage
git commit -m "Renommage de notes.txt en git-notes.txt"


###############################################################################
# EXERCICE 7 : Comprendre les snapshots Git (git ls-tree)
###############################################################################
echo
echo "===================="
echo "EXERCICE 7 : Snapshots Git"
echo "===================="

# 1. Visualiser l’historique condensé
git log --oneline

# On récupère le dernier commit (HEAD) pour l’inspecter.
# Note : on pourrait aussi utiliser un hash précis trouvé dans le log.
LAST_COMMIT_HASH=$(git rev-parse HEAD)

echo "Inspection du snapshot du commit : $LAST_COMMIT_HASH"

# 2. git ls-tree -r <hash> : lister le contenu (arbre) du snapshot
#    - -r : récursif
git ls-tree -r "$LAST_COMMIT_HASH"

# COMMENTAIRE :
# - Un snapshot Git est une photo complète de l’état du projet (fichiers + arborescence).
# - Git stocke des objets : blobs (contenu des fichiers) et trees (dossiers).
# - Ce modèle snapshot rend Git rapide, fiable et facilite les merges.

###############################################################################
# EXERCICE 8 : Débogage avec git bisect (version simple et pédagogique)
###############################################################################
echo
echo "=============================="
echo "EXERCICE 8 : Débogage avec git bisect"
echo "=============================="
echo
echo "Objectif : Identifier automatiquement le commit qui introduit un bug."
echo "Git bisect utilise une recherche binaire pour trouver le premier commit fautif."
echo

echo "Étape 1 : Création de plusieurs versions successives..."
echo

# Version 1 (bonne)
echo "version 1" > version.txt
git add version.txt
git commit -m "Version 1"

# Version 2
echo "version 2" > version.txt
git commit -am "Version 2"

# Version 3
echo "version 3" > version.txt
git commit -am "Version 3"

# Version 4 (BUG introduit volontairement)
echo "version 4 - BUG" > version.txt
git commit -am "Version 4"

# Version 5
echo "version 5" > version.txt
git commit -am "Version 5"

# Version 6
echo "version 6" > version.txt
git commit -am "Version 6"

echo
echo "Étape 2 : Préparation du bisect"
echo "--------------------------------"
echo "HEAD contient le bug (version 6)."
echo "La version 1 était bonne."
echo

GOOD_COMMIT=$(git log --grep="Version 1" --format="%H" | head -n 1)

echo "Commit GOOD (Version 1) : $GOOD_COMMIT"
echo "Commit BAD (HEAD) : $(git rev-parse HEAD)"
echo

echo "Étape 3 : Démarrage du bisect"
echo "--------------------------------"
git bisect start
git bisect bad
git bisect good "$GOOD_COMMIT"

echo
echo "Git a maintenant choisi un commit intermédiaire."
echo "Ouvrez le fichier version.txt pour vérifier s'il contient le BUG."
echo
echo "Si le fichier contient 'BUG' :"
echo "    git bisect bad"
echo
echo "Si le fichier NE contient PAS 'BUG' :"
echo "    git bisect good"
echo
echo "Répétez jusqu'à ce que Git affiche :"
echo "    <hash> is the first bad commit"
echo

echo "Étape 4 : Fin du bisect"
echo "--------------------------------"
git bisect reset
echo "Retour à l'état normal du dépôt."
echo

echo "Exercice 8 terminé."
echo "=============================="

###############################################################################
# FIN DU TP
###############################################################################
echo
echo "===================="
echo "TP1 terminé (script corrigé exécuté avec succès)."
echo "===================="