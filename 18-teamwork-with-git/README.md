# Teamwork with Git

## Agenda

1. The importance of collaboration
2. Commits as communication
3. Visualizing your repo
4. Branching
5. Merging
6. Resolving merge conflicts
7. Pull requests


## Typical Teamwork Workflow

* I fork a repo
* I add team as collaborators with write access
* Everyone in the group clones that repo
* I create a feature branch (ie. add-review-validations)
* I make changes and commit to the branch
* I push the branch
* Everyone pulls the latest on master
* Everyone switches to add-review-validations
* Everyone switches back to master
* I merge the changes into master
* Everyone pulls again

## Branching
### Creating a branch
* git checkout -b my-feature-branch
  * This will create a new branch called `my-feature-branch`
  * This will also move you to your new branch

### Moving between branches
* git checkout another-branch

### Git Them Bugs Exercise (Branching Drill)
* Fork and clone the Git-Them-Bugs repo
  * https://github.com/bitmakerlabs/wdi-git-them-bugs



## Merging
1. Checkout to the branch where you want to merge content into (ie. master)
  * git checkout master
2. Merge the changes from your feature branch (ie. my-feature-branch)
  * git merge my-feature-branch
3. If there are merge conflicts, resolve conflicts

### Mad Libbing Exercise
#### Getting started
* Get into groups
* One person forks the Mad Libs repo
  * https://github.com/bitmakerlabs/mad-libs
* Owner adds teammates as collaborators with write access
* Everyone in the group clones the repo

#### Exercise
* Everyone makes a feature branch
* Follow the usual edit-stage-commit process
* When finished,
  * Switch back to master and pull to get the latest code
  * Merge your feature branch into master
  * If there are conflicts, resolve them first

## Recap
* When working on a new feature, create a new branch
  * git checkout -b my-cool-branch

* When moving between branches, use this command:
  * git checkout name-of-branch
    * ie. git checkout master

* To merge:
  * git merge name-of-branch
    * ie. git merge my-cool-branch

* Resolving merge conflicts
  * Merge conflicts look like this!

>>>>>>>>> HEAD
stuff from remote
=========
stuff from my own feature branch
<<<<<<< my-cool-branch

* Anytime you want to merge to master, it's best practice to pull first
  * git checkout master (move back to master)
  * git pull (pull from origin/master)

  
