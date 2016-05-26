# Associations in Rails

You've made a simple app with only one data model. Now it's time to up our game and create multiple related models and associate them together.


## Agenda

0. Migrations overview
1. What is Active Record?
2. What is an association?
3. Foreign key review
3. Types of associations
4. Reading the docs
5. belongs_to
6. has_many
7. has_many , through:
8. has_and_belongs_to_many
9. has_one
10. has_one , through:


## What is Active Record?
- Active Record is what's called an object relational mapper (ORM)
- This is the magic sauce that translates regular Ruby methods into SQL statements to query the database
- The purpose of an ORM is to abstract out the database and move your schema into your code
- An extremely useful purpose of the ORM is to allow you to change databases (eg. from SQLite to PostgreSQL) without changing code


## What is an association?
- Associations are the mechanism used in Rails (and most database systems) to relate separate classes of data together.
- For instance, you might have an app with Recipe and Ingredient models.  Each recipe is made up of many ingredients, and each ingredient can be used in many different recipes.  We need a way to make that connection.


## Types of Associations
- 1-to-1
- 1-to-many
- many-to-many

## Reading the docs
- [Active Record Associations](http://guides.rubyonrails.org/association_basics.html)
- Rails Guides and the Rails API are your best resources on the different associations and how they work
- Sections 1 and 2 will be your starting point for learning about the different association types
- Section 3 is for more advanced use cases, you'll probably only need this info periodically
- Section 4 will be your bread and butter once you're comfortable with the basics
