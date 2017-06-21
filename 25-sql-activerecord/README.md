# SQL and ActiveRecord

We will now start learning more about the Model Layer of Rails.

SQL will be covered more in depth (which was introduced in ***Intro to Databases***), and we will also go more in depth with ActiveRecord, which allows us to access a database by writing Ruby code instead of SQL.

## Agenda

* [Review](#review) (5 mins)
* [Components of a Database](#components-of-a-database) (30 mins)
* [Postgres](#postgres) (5 mins)
* [Chinook](#chinook) (5 mins)
* [SQL](#sql) (30 mins)
* [ActiveRecord](#activerecord) (40 mins)

## Review

* What is a database?
* Why do we need databases?

## Components of a Database

* **Tables**: Demonstration of emulating a database with Google spreadsheet tables
* **Columns**: attributes, name, data type
* **Row**: Record, represents a set of data for each column
* **Primary key**:
  * `id`
  * Uniqueness
  * Can be an integer or [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) (349tu-hbe0984-5hww9e8y5h)
* **Foreign key**:
Allows you to associate to another table. i.e.
`objectname_id`
* [ACID](https://en.wikipedia.org/wiki/ACID)

## Postgres

* [Installing Postgres](https://github.com/bitmakerlabs/rails-dev-setup-guide#postgres)
* How to run `psql`
* Postgres commands:
  * `\q` - quits from Postgres
  * `\l` - lists all the databases in the system

## Chinook

* Forking, cloning, and installing [Chinook](https://github.com/bitmakerlabs/chinook) and its database.
* How to install a Rails app
  * `bundle install`
  * `bin/rails db:setup`
  * `psql chinook_development < chinook.sql`
* How to access a particular DB in Postgres: `psql chinook_development`
* More Postgres commands:
  * `\dt` - lists all the tables in the current db
  * `\d albums` - describes the albums table

## SQL

* Examples of various `SELECT` statements that exercise `ORDER BY`, `WHERE`, `COUNT`, `SUM`, `LIKE`, `ILIKE`

## ActiveRecord

* Installation of `awesome_print` gem, which requires running `AwesomePrint.irb!` in the Rails console.
* Required Reading: [Rails Guide: Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html), and [Rails Guide: Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html) chapters 1-6, 14, 18-21
* Why do we use ActiveRecord instead of SQL?
* Examples of various ActiveRecord queries that exercise `first`, `last`, `all`, `where`, `size`, `order`, `limit`
* The 3 different styles of `where` queries:
  * Hash style (preferred)
  * Array style
  * String style
* Mention of SQL Injection Attacks
* Chaining `where` to create AND queries
* Using `.or` to create OR queries
* Difference between `find` and `where`
* Difference between `find` and `find_by`

## Links

* [Rails Diagram](https://srikantmahapatra.files.wordpress.com/2013/11/mvc1.png)
* [DDL/DML/DCL](http://www.w3schools.in/mysql/ddl-dml-dcl)
* [XKCD: SQL Injection Attack](https://xkcd.com/327/)
* [Wikipedia: ACID](https://en.wikipedia.org/wiki/ACID)
* [Wikipedia: UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier)
* [Rails Guide: Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)
* [Rails Guide: Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html)
* [Chinook](https://github.com/bitmakerlabs/chinook)
