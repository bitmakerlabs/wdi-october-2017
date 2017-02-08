# Testing with Rails

Testing is a fundamental part of Rails. Today we'll introduce how testing works in Rails.

## Agenda

* Intro to Testing in Rails (30 mins)
* TDD Demo (85 mins)

## Intro to Testing in Rails

* Why do we do testing?
  * Manual vs Automated
* Difference between regular Ruby testing with `Minitest` and Rails testing.
  * Database
  * Multiple layers (MVC)
* What is the goal of a test?
  * Basically, check that the output is what you expect given a certain set of inputs.
* What is a Fixture
* What is a Factory (fixture replacement)
* The `test` environment?
* Structure of Rails `test` directory
* Different types of Rails tests
  * Model
  * Controller
  * Integration
* `ActiveSupport::TestCase`
* The Rails testing DSL

## TDD Demo

* What is TDD
* Usage of Fixtures
* Usage of Factories with `factory_girl_rails`
* How to run tests
  * Run all tests with `bin/rails test`
  * Run one test with `bin/rails <testfile.rb>:<line number>`, e.g. `bin/rails test/models/user_test.rb:27`
* Seatyourself simple model tests
  * `two restaurants exist`
  * `small restaurant has small capacity`
* Seatyourself `Restaurant#available?` tests
  * `restaurant is not available for zero-sized party`
  * `restaurant is available for a small party`
  * `restaurant is not available for a huge party`
  * `restaurant is not available when it is full`
  * `restaurant is available when it is not full`
  * `restaurant is available for reservations later`
* `bin/rails stats` command

## Links

* [`ActiveSupport::TestCase` Documentation](http://api.rubyonrails.org/classes/ActiveSupport/TestCase.html)
* [Rails Guide: Testing](http://guides.rubyonrails.org/testing.html)
* [`factory_girl` documentation](https://github.com/thoughtbot/factory_girl)
* [`factory_girl_rails` documentation](https://github.com/thoughtbot/factory_girl_rails)