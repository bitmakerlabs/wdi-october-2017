# Authentication and Authorization

## Agenda

  1. How to evaluate a gem
  2. Authentication review
  3. Using the Sorcery gem

  ---

  1. What is authorization?
  2. What are some ways to implement it?
  3. Using the Cancancan gem
  4. Ways to define roles for your users


## Versioning
Semantic Versioning (SemVer)

MAJOR  MINOR  PATCH
4      .2     .4

## Binary Math
0 = 00000000
1 = 00000001
2 = 00000010
4 = 00000100

3 = 00000011

00000011 = [collaborator, banned]
00000100 = admin

00000011 = [collaborator, banned]
00000010 = collaborator
