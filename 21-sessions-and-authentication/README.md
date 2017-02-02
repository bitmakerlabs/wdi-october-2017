# Sessions and Authentication

In this lesson, we'll be looking at the mechanisms by which you can identify your users with each request.

## Agenda

* [Associations Recap](#associations-recap) (20 mins)
* [Authentication](#authentication) (30 mins)
* [Sessions](#sessions) (5 mins)
* [Code Example](#code-example) (55 mins)
* [Authorization](#authorization) (5 mins)

## Associations Recap

* `belongs_to`
* `has_many`
* `has_one`
* `has_and_belongs_to_many`
  * Requires a **Join Table** without a model
* `has_one :through`
* `has_many :through`
  * Requires a intermediate model
* Review of Chinook relationships

## Authentication

* What is authentication?
* Difference between authentication (authn) and authorization (authz)
* Encryption
* Hashing
* Difference between Encryption and Hashing
* Salting
* Rainbow Tables
* [bcrypt-ruby](https://github.com/codahale/bcrypt-ruby) gem
* Rails [`has_secure_password`](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html) method
* Manual example of authentication

## Sessions

* Stateless nature of HTTP
* What is a session?
* What is a cookie?

## Code Example

* `User` model
* Install `bcrypt-ruby`
* Use of `has_secure_password`
* Manual authentication in Rails console
* Signing up for the app with `UsersController#new` `UsersController#create`
* Logging into the app with `SessionsController#new` and `SessionsController#create`
* Singular `resource` vs plural `resources`
* Using the `session` hash

## Authorization

* Sneak peek at authorization

## Links

* [Associations Recap Slides](http://bitmakerlabs.s3.amazonaws.com/slides/cohort9/Associations%20recap.pdf)
* [Rails Guide: Active Record Associations](http://guides.rubyonrails.org/association_basics.html)
* [Chinook Relationships](http://bitmakerlabs.s3.amazonaws.com/slides/cohort9/chinook.pdf)
* [Authentication Slides](http://bitmakerlabs.s3.amazonaws.com/slides/cohort9/Authentication.pdf) - These are old slides and are for Reference Only
* [`has_secure_password` Documentation](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
* [Example of Encryption](https://www.education.com/files/438801_438900/438850/invent-a-secret-code-350x440.jpg)
* [bcrypt-ruby](https://github.com/codahale/bcrypt-ruby)
