# Authentication and Authorization

## Agenda

  1. Authentication vs Authorization
  1. Rolling our own vs using a library
  1. How to evaluate a gem
  1. Using the Sorcery gem for authentication
  1. Using the CanCanCan gem for authorization

## Authentication vs Authorization
+ **Authentication:** Who you are
+ **Authorization:** What you are allowed to do

## Rolling Our Own vs Using a Library
Until know, we gone with a fairly minimal solution, using `bcrypt` and `has_secure_password`. However, as developers, whenever we have a problem to solve, we should ask ourselves a few questions:
1. Has someone else already solved this problem?
1. Do I understand the problem well enough to solve it?
1. Is their solution appropriate for my use case?
1. Do I need to have direct control over the implementation of this solution?

The answers to these questions will inform whether or not we should use a library to solve the problem for us instead of implementing our own solution.

In the case of authentication and authorization, this is a problem that has already been solved many times. Its a problem where the solution is applicable to most use cases, and we rarely need to have direct control over its implementation. Its also a problem we probably understand poorly, or do not have a complete understanding of. Furthermore, it is a problem that is potentially **dangerous** if implemented poorly.

All of these factors together tell us that we should probably use an existing solution instead of creating our own solution from scratch.

## Evaluating a Gem
When trying to decide what gem to use for a particular problem, we want to make sure that:
1. The gem actually solves our problem in the way we want
1. That it is well maintained
1. That it is used by a reasonable number of users
1. That it is likely to be maintained in the future

This is a bit of an arcane art, but we can use tools like [Ruby Toolbox](https://www.ruby-toolbox.com/) to help us, and by poking around the repo for the gem.

## Using Sorcery
We'll be implementing authentication for [this project](https://github.com/bitmakerlabs/clubz) using the [Sorcery authentication gem](https://github.com/Sorcery/sorcery).

We'll follow along with [this tutorial](https://github.com/Sorcery/sorcery/wiki/Simple-Password-Authentication), and explain along the way.

## Using CanCanCan
For authorization, we'll use [CanCanCan](https://github.com/CanCanCommunity/cancancan).

We'll cover [role based authorization](https://github.com/CanCanCommunity/cancancan/wiki/Role-Based-Authorization), and stick with defining possible roles as a constant array on the `Club` model, though we can talk about alternative approaches as well.

After that, we'll [define our abilities](https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities), and [check the users abilities](https://github.com/CanCanCommunity/cancancan/wiki/Checking-Abilities) in our controller.

## Versioning
Semantic Versioning (SemVer)
```
MAJOR  MINOR  PATCH
4      .2     .4
```

## Binary Math
```
0 = 00000000
1 = 00000001
2 = 00000010
4 = 00000100

3 = 00000011

00000011 = [collaborator, banned]
00000100 = admin

00000011 = [collaborator, banned]
00000010 = collaborator
```
