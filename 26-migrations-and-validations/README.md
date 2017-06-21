# Migrations & Validations

This lesson continues our exploration of the Model Layer of Rails.

We will learn about migrations and what they are used for. We'll also look at the concept of validations, why they're important and how to implement them in your models.

## Agenda

* [Review](#review) (5 mins)
* [ActiveRecord Continued](#activerecord-continued) (30 mins)
* [Migrations](#migrations) (30 min)
* [Validations](#validations) (50 min)

## Review

* Review of ActiveRecord querying

## ActiveRecord Continued

* Scopes
* Class Methods vs Scopes

## Migrations

* Migrations and their purpose
* When are migrations needed?
* What kinds of changes can be made with a migration?
  * `create_table`
  * `drop_table`
  * `add_column`
  * `remove_column`
  * `rename_column`
  * `rename_table`
  * Others as documented in [Active Record Migrations Guide](http://guides.rubyonrails.org/active_record_migrations.html#using-the-change-method)
* Creating a migration
  * `bin/rails generate migration`
* How to rollback a migration

## Validations

* What is a validation?
  * Why are validations important?
  * How do I know what to validate?
* Different types of validations
  * `presence`
  * `length`
  * `numericality`
  * `uniqueness`
  * If time, others as detailed in [Active Record Validations guide](http://guides.rubyonrails.org/active_record_validations.html#validation-helpers)
* The `valid?` method
* `errors` object
  * `errors.messages`
  * `errors.full_messages`
* Custom validation method: `validate` vs `validates`


## Links

* [Rails Diagram](https://srikantmahapatra.files.wordpress.com/2013/11/mvc1.png)
* [DDL/DML/DCL](http://www.w3schools.in/mysql/ddl-dml-dcl)
* [Rails Guide: Active Record Migrations](http://guides.rubyonrails.org/active_record_migrations.html)
* [Rails Guide: Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html)
