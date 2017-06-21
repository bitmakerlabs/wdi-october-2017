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
* I create a feature branch (ie. `add-review-validations`)
* I make changes and commit to the branch
* I push the branch
* Everyone pulls the latest on master
* Everyone switches to `add-review-validations`
* Everyone switches back to master
* I merge the changes into master
* Everyone pulls again

## Branching
To create a new branch, you can use the command:
```
git branch a-new-branch
```

This will not move you to `a-new-branch` however, it will only create it.

To then move to the new branch, we need to `checkout` the branch:
```
git checkout a-new-branch
```

Now we've checked the branch out.

To both create a new branch and move to it immediately, we can do this:
```
git checkout -b my-feature-branch
```

### Git Them Bugs Exercise (Branching Drill)
* Fork and clone the Git-Them-Bugs repo
  * https://github.com/bitmakerlabs/wdi-git-them-bugs

## Merging
1. Checkout to the branch where you want to merge content into (ie. master)
  * `git checkout master`
2. Merge the changes from your feature branch (ie. my-feature-branch)
  * `git merge my-feature-branch`
3. If there are merge conflicts, resolve conflicts

## Conflicts
If two commits try to change the same line(s) of code in two seperate branches, when we try to merge them together we'll get a **merge conflict**. A merge conflict simply means that git doesn't implicitly know how to merge things together, so we have to tell it. A merge conflict will look something like this:
```
>>>>>>>>> HEAD
stuff from remote
=========
stuff from my own feature branch
<<<<<<< my-cool-branch
```

Everything between the ``>>>>>`` and the ``=====`` is one branch of code. Everything between ``=====`` and ``<<<<<`` is the other.

Here we just need to make changes to the file as appropriate, remove our ``>>>``, ``<<<``, and ``===`` delimiters, and mark the resolution. `git status` is good at telling you what your next step should be in the process along the way.

## Rebasing
Sometimes you'll do work on a branch, but in the meantime other work will take place on the master branch. Pulling those changes into our branch can be done in two ways: by merging master into our branch, or by rebasing our branch.

Rebasing means that we are going to take all of our branches changes, temporarily set them aside, pull in the changes from master, and then place our changes back on top.

To rebase our feature branch against master, while our branch is checked out we can run:
```
git pull --rebase origin master
```

If we've already pushed our branch to origin before the rebase, git will show us an error next time we try to push. This is git trying to protect us from accidentally overwrite some previous work. We've taken our changes, removed them, and readded them on top, so as far as git is concerned we're trying to destroy some of our previous commits! Of course, we know that we've simply moved them, but git isn't smart enough to realize this.

We can instruct git to push the changes anyways, but we have to be careful here; we may accidentally overwrite someone else's changes. We can **mostly** protect ourselves from this by using this command:
```
git push --force-with-lease origin my-cool-branch
```

**However, it is still possible to overwrite some commits with this command, so be careful.**

## Mad Libbing Exercise
### Getting started
* Get into groups
* One person forks the Mad Libs repo
  * https://github.com/bitmakerlabs/mad-libs
* Owner adds teammates as collaborators with write access
* Everyone in the group clones the repo

### Exercise
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
```
>>>>>>>>> HEAD
stuff from remote
=========
stuff from my own feature branch
<<<<<<< my-cool-branch
```

* Anytime you want to merge to master, it's best practice to pull first
  * git checkout master (move back to master)
  * git pull (pull from origin/master)

