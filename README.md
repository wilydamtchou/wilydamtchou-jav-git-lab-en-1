UCC 131-1
Gitflows: Github, Gitlab

Lab 1 : Git Fondamentals


General Objective
Put into practice all the fundamental concepts of Git before tackling collaborative workflows. 

Learning Objectives
At the end of this lab, the student will be able to: 
Initialize and manipulate a local Git repository 
Understand Git areas (Working Directory, Staging Area, Repository) 
Create coherent and professional commits 
Explore history and snapshots 
Manipulate files (add, delete, rename, restore) 
Diagnose common errors 
Use git diff, git log, git restore, git rm, git mv 
Understand the snapshot model and Git internal architecture 
Use git bisect to identify a faulty commit 

Exercice 1: Initializing a Git Repository

1.1 Actions
Create a folder named tp-session1-git. 
Move into this folder via the terminal. 
Initialize a Git repository. 
Check the status of the repository. 

1.2 Deliverables
Commands used 
Output of git status 

Exercice 2: Git areas: Working Directory (WD), Staging, Repository

2.1 Actions
Create a file notes.txt containing: 


Git est un système de gestion de versions distribué.


Check the status of the repository. 
Add the file to staging. 
Check the status again. 
Make a commit with a clear and professional message.

2.2 Deliverables
Commands 
Commit message 

Exercice 3: Changes, diffs and commits

3.1 Actions
Add a second line to notes.txt :


Il utilise un modèle basé sur des snapshots.


Display the differences between WD and staging. 
Add the modification to staging. 
Display the differences between staging and repository. 
Make a commit. 

3.2 Deliverables
Output of git diff 
Output of git diff –staged

Exercice 4: Historique et navigation

4.1 Actions
Display the full history. 
Display the history in compact mode. 
Display the history as a graph. 

4.2 Deliverables
Output of git log --oneline --graph --decorate
Exercice 5: Restoring files

5.1 Actions
Delete the first line of notes.txt. 
Without making a commit, restore the file to the state of the last commit. 
Check that the restoration worked. 
Explain the difference between git restore and git checkout. 

5.2 Deliverables
Commands
Explanation
Exercice 6: Deletion and renaming

6.1 Actions
Create a file draft.txt. 
Add it to staging and make a commit. 
Delete it with Git. 
Rename notes.txt to git-notes.txt. 
Commit the changes. 
Explain why git rm is preferable to rm.

6.2 Deliverables
Commands
Explanation
Exercice 7: Understanding Git snapshots

7.1 Actions
Display the hash of the last commit. 
List the contents of the snapshot with: 


git ls-tree -r <hash>


Explain what a snapshot is in Git. 

7.2 Livrables
Output of  git ls-tree 
Explanation

Exercice 8: Debugging with git bisect (simulation) 

8.1 Actions
Create a file version.txt containing:


version 1


 
Make a commit. 
Create 5 new commits by incrementing the version (2 → 6). 
Introduce a bug in version 4 by adding:


BUG


Use git bisect to identify the faulty commit. 
Note the commit found. 

8.2 Deliverables
Bisect commands 
Faulty commit identified
