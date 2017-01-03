# Associations in Rails

You've made a simple app with only one data model. Now it's time to up our game and create multiple related models and associate them together.


## Agenda

1. What is data modelling?
2. Review of database concepts
3. Types of relationships
4. What is an association?
5. One to many
6. Reading the docs
7. Many to many

[Slides](https://s3.amazonaws.com/bitmakerhq/lessons/web-development/2016-08-team-johnny5/associations.pdf)

## What is data modelling? (less than 5 minutes)
- Designing the models of your app, what attributes they need, and the relationships that exist between them

## Review of database concepts (15 minutes)
- tables, rows, columns
- primary keys
- foreign keys
- join tables

## Types of relationships (15 minutes)
- 1-many
- 1-1 (uncommon)
- many-many
- rules for each in terms of database structure

## What is an association? (5 minutes)
- A way of informing our models about the relationships that exist in the database
- Your models will make a series of assumptions about what your database looks like based on these associations.  Rails *will not* create the necessary database changes for you as a result of adding associations to your models.
- The reason we add associations to our models is to take advantage of shortcuts for retrieving associated data from the database (instead of having to construct our own `where` queries, etc)

## One to Many (30 minutes)
`belongs_to`, `has_many`, and what they tell the models about the database

- implement with pictures & comments in Photogur to see how it benefits us when it comes to adding code in the controllers & views

### Reading the docs (5 minutes)
- [Active Record Associations](http://guides.rubyonrails.org/association_basics.html)
- Sections 1 and 2 will be your starting point for learning about the different association types
- Section 3 is for more advanced use cases, you'll probably only need this info periodically
- Section 4 will be your constant reference once you're comfortable with the basics

## Many to many (15 minutes)
- `has_many, through:`
- `has_any_belongs_to_many`
- deciding when to make the join table into its own model

## Summary (5-10 minutes)
- 1-many (foreign key on "many" side)
- 1-1 (worry about later)
- many-many (join table with foreign keys referring to both models)
- Join table could be its own model if there is more information about that relationship
- Associations inform your Rails models about what relationships exist in the database
- We add association code because it gives us convenient methods for retrieving data from the database
