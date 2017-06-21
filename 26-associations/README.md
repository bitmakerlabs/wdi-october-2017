# Associations in Rails


## Agenda

1. Review of foreign keys, join tables, relationships
2. What is an association?
3. One to many
4. Reading the docs
5. Many to many
6. Through relationships

## Types of relationships
- 1-many
- 1-1 (uncommon)
- many-many

## What is an association?
- A way of informing our models about the relationships that exist in the database
- Your models will make a series of assumptions about what your database looks like based on these associations.  Rails *will not* create the necessary database changes for you as a result of adding associations to your models.
- The reason we add associations to our models is to take advantage of shortcuts for retrieving associated data from the database (instead of having to construct our own `where` queries, etc)

## One to many
`belongs_to`, `has_many`, and what they tell the models about the database

- implement with pictures & comments in Photogur to see how it benefits us when it comes to adding code in the controllers & views

### Reading the docs
- [Active Record Associations](http://guides.rubyonrails.org/association_basics.html)

## Many to many
- `has_many, through:`
- `has_any_belongs_to_many`
- deciding when to make the join table into its own model

- implement with pictures & tags in Photogur

## Through associations
- other associations required

- implement for comments & tags in Photogur
