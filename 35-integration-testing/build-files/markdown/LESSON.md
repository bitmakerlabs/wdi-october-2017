for: slides

### *Today's Lesson*
# Testing: Behavioural and Integration

???
Start quick-time


---

for: alexa readme slides
name: agenda

# Agenda

### Overview & Intro .agenda-time[(5 min)]

--

### Word Slinger .agenda-time[(100 min)]

Let's create a Content Management System!

We'll cover:

- guard
- capybara
- integration testing

--

### Recap and Further Resources  .agenda-time[(5 min)]

---

for: alexa readme slides

layout: true

# Testing

---

for: alexa readme slides

Because *ruby* is such a dynamic language, testing is a big part of ruby culture.

--

Releasing untested ruby code is frowned upon by the community.

--

In comparison, testing isn't as ingrained in the *python* community.

--

However, the python community is known for its excellent documentation.


---

for: alexa readme slides

layout: true

# New Rails Project

---

for: alexa readme slides

Today we'll be developing a simple Content Management System.

--

I'm calling it "*Word Slinger*".

--

for: alexa readme slides

```bash
$ rails new word-slinger
```


---

```bash

```

---

for: alexa readme slides

Let's commit our code.

---

for: alexa readme slides

layout: true

# Gemfile

---

for: alexa readme slides

Our first stop.

---

for: alexa readme slides

Let's only keep the essentials:

#### All Environments:

- `rails`
- `sqlite3`
- `bcrypt`

#### Development:

- `web-console`

#### Test:

- `capybara`

Everything else can go!

---

for: alexa readme slides

This is what our Gemfile should look like:

`/Gemfile`

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'sqlite3'
gem 'bcrypt'

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
end
```

---

for: alexa readme slides

Now let's add the following to our Gemfile:

- `guard` to development
- `guard-minitest` to development
- `launchy` to test
- `pry-rails` to development and test

---

for: slides

Now our Gemfile should look like this:

`/Gemfile`

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'sqlite3'
gem 'bcrypt'

group :development do
  gem 'web-console'
* gem 'guard'
* gem 'guard-minitest'
end

group :test do
  gem 'capybara'
end

*group :development, :test do
* gem 'pry-rails'
*end

```

---

for: alexa readme slides

Run bundle:

```bash
$ bundle
```

<small>(you can type `bundle install` instead if you prefer, but you don't have to, as the default option for `bundle` is `bundle install`)</small>

---

for: alexa readme slides

class: table

Let's take a look at these Gems. First the ones you're already familiar with:

--
- `rails`       web framework
--
- `sqlite3`     database
--
- `bcrypt`      password encryption
--
- `web-console` browser REPL*

--
- `pry-rails`   terminal REPL*

--

*REPL means "Read-Evaluate-Print-Loop".<br>
--
`irb`, `pry` and `byebug` are REPLs.

--

*READ*: what you type into the computer is *read* by the computer.

--

*EVALUATE*: the computer *evaluates* (processes) what it *read*.<br>

--

*PRINT*: the computer *prints* out the result of what it *evaluated*.<br>

--

*LOOP*: the computer loops back to the start and gives you a prompt so you can type something again.

---

for: alexa readme slides

A few new Gems:

--

### Guard

--

Automates tasks by running scripts when files are changed.

--

### Guard-Minitest

--

A minitest plugin for `guard`.

--

We'll run tests whenever we save new code.

---

for: alexa readme slides

### Capybara

--

Testing library that simulates interactions with a web application.

--

For example:

- filling out forms
- clicking links

---

for: alexa readme slides

### Launchy

Allows *capybara* to open a web browser with the web page it was testing.

---

for: alexa readme slides

Let's commit our code.

---

for: alexa readme slides

layout: true

# Database

---

for: alexa readme slides

What does our `/db` directory currently look like?

```bash
$ ls db
```

--

It's nothing but an empty seeds file.

---

for: alexa readme slides

Let's take a look at the database config:

```bash
$ cat config/database.yml
```

```ruby
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

# ...

```

---

for: slides

Notice that we need the sqlite3 gem in order to use sqlite:

```bash
$ cat config/database.yml
```

```ruby
# SQLite version 3.x
#   gem install sqlite3
#
*#   Ensure the SQLite 3 gem is defined in your Gemfile
*#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

# ...

```

---

for: slides

This is the file *rails* will store the *development* database in:

```bash
$ cat config/database.yml
```

```ruby
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
* database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

# ...

```

---

for: slides

This is the file *rails* will store the *test* database in:

```bash
$ cat config/database.yml
```

```ruby
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
* database: db/test.sqlite3

# ...

```

---

for: slides

Every time we run our tests, the *test database* is re-generated:

```bash
$ cat config/database.yml
```

```ruby
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

*# Warning: The database defined as "test" will be erased and
*# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

# ...

```

---

for: alexa readme slides

If you want to use *postgres* instead of *sqlite*, `database.yml` is where you'd configure this.

--

But we'll stick with `sqlite` for this project.

---

for: alexa readme slides

Let's take another look at the `db` folder:

```bash
$ ls db
```

--

Still only the `seeds.rb` file.

--

Now run:

```bash
$ rails db:setup
```

--

Check the `db` folder again:

```bash
$ ls db
```

--

There's our two databases.

--

Notice that they're currently zero bytes in size.

---

for: alexa readme slides

Now run:

```bash
$ rails db:migrate
```

--

And look at `db`:

```bash
$ ls db
```

--

We now have:

```
`schema.rb`
```

---

for: alexa readme slides

And the byte size has increased for:

```
development.sqlite3
```

--

but not for:

```
test.sqlite3
```

--

As the structure for the test database will be created when we run our tests.

---

for: alexa readme slides

Why does our database have structure even though we haven't created any migrations?

--

It's because *rails* creates a few tables to keep track of application metadata:

```bash
$ rails db
```

--

```bash
sqlite> .tables
```

--

Two tables have been created:

`schema_migrations` and `ar_internal_metadata`

---

for: alexa readme slides

### `schema_migrations`

Rails uses this table to keep track of which migrations have been run.

--

```sql
sqlite> SELECT * FROM schema_migrations;
```
--

There's nothing here yet because we haven't run any migrations.

---

for: alexa readme slides

### `ar_internal_metadata`

This table is used to store the database environment. Plus, if it's a `production` database, *rails* raises an exception if a destructive command is accidentally run on it.

--

```sql
sqlite> SELECT * FROM ar_internal_metadata;
```
--

We can see it's a `development` database.

---

for: slides

Let's commit our code.

--

Notice that databases aren't committed as they're in `.gitignore`

```bash
cat .gitignore
```

```
# ...

# Ignore bundler config.
/.bundle

*# Ignore the default SQLite database.
*/db/*.sqlite3
*/db/*.sqlite3-journal

# Ignore all logfiles and tempfiles.
/log/*
/tmp/*

# ...
```

---

for: alexa readme slides

layout: true

# Guard

---

for: alexa readme slides

We'll set up *guard* so we don't have to run our tests manually every time we change our code.

--

```bash
$ guard init
```

--

It has created a `Guardfile`:

```bash
$ ls
```

--

And added a config for minitest. Why? Because it detected minitest as part of our gem set:


```bash
$ cat Guardfile
```

---

for: alexa readme slides

Let's change up our config to just watch for changes in our application and test folder:

`/Guardfile`

```ruby
guard :minitest do
  watch(/app\/.*/)          { 'test' }
  watch('config/routes.rb') { 'test' }
  watch(/test\/.*/)         { 'test' }
end

callback([:run_on_additions_begin, :run_on_removals_begin]) do
  minitest_plugin = Guard.state.session.plugins.all.find { |plugin| plugin.name == 'minitest' }
  minitest_plugin.run_all
end
```

--

Type `guard` to run *guard*:

```bash
$ guard
```

--

It runs our test suite (even though we don't have any tests yet).

--

It's now watching our application folder for any changes.

---

for: alexa readme slides

Open `/config/routes.rb` and save it.<br>
<small>(even though you didn't make any changes to the file).</small>

--

*Guard* notices the new modified timestamp on `routes.rb` and runs the tests again.

--

You can also run the tests by pressing `<enter>` at the *guard* prompt.

---

for: alexa readme slides

The *guard* prompt is a REPL.

--

Try some *ruby*:

```ruby
guard(main)> 1 + 1
```

--

Note that the *guard* prompt more like `irb` or `pry`, and it doesn't load up our *rails* environment.

--

This means you can't access your rails application from the guard prompt.

--

Type :

```ruby
guard(main)> Rails

```

--

See -- no rails!

---

for: alexa readme slides

We're going to keep `guard` running in this terminal. Open a new terminal to work from.

---

for: alexa readme slides

Let's commit.

---

for: alexa readme slides

layout: true

# Test Helper

---

for: alexa readme slides

Open `/tests/test_helper.rb`.

---

for: alexa readme slides

To get everything working nicely, we'll need to:

--

- set the *Rails environment* to *test*

--

- require `minitest-pride`

--

- require `capybara`

--

- remove the comments

---

for: slides

Your test helper should look like this:

`/tests/test_helper.rb`

```ruby
*ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
*require 'minitest/pride'
*require 'capybara/rails'
*require 'capybara/minitest'

class ActiveSupport::TestCase
  fixtures :all
end

*class ActionDispatch::IntegrationTest
* include Capybara::DSL
*
* def teardown
*   Capybara.reset_sessions!
* end
*end

```

--

Notice *guard* runs when you save this file.

---

for: alexa readme

Your test helper should look like so:

`/tests/test_helper.rb`

```ruby
*ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'capybara/minitest'

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
 include Capybara::DSL

 def teardown
   Capybara.reset_sessions!
 end
end

```

--

Notice *guard* runs when you save this file.

---

for: alexa readme slides

Let's commit.

---

for: alexa readme slides

layout: true

# Pages

---

As our application is a Content Management System, *pages* are going to be the main resource.

--

for: alexa readme slides

Let's create the model we'll need:

```bash
$ rails g model page --skip-test-framework
```

--

Notice that I've passed a `skip` flag to the `rails generate` command. This way, files we're not going to use aren't created.

--

I like to keep the cruft out of my applications.

---

for: alexa readme slides

layout: true

# Database Migration

---

for: alexa readme slides

Our *page* model will have:

--

## Title

--

This will go in an `<h1>` tag at the top of the page.

--

## Content

--

This will be the content for the page.

--

## Slug

--

The *slug* will be used in the URL to pull up a specific page.

---

for: slides

Let's add these fields to our database migration:

`/db/migrate/<time-stamp>_create_pages.rb`

```ruby
class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
*     t.string :title
*     t.text   :content
*     t.string :slug
      t.timestamps
    end
  end
end
```

---

for: alexa readme

Let's add these fields to our database migration:

`/db/migrate/<time-stamp>_create_pages.rb`

```ruby
class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text   :content
      t.string :slug
      t.timestamps
    end
  end
end
```

---

for: alexa readme slides

Run our migration:

```bash
$ rails db:migrate
```

--

Take a look at `db/schema.rb` and make sure everything looks good.

---

for: alexa readme slides

And now let's commit and be sure to review what we're commiting with:

```
$ git status
$ git diff HEAD
```

---

for: alexa readme slides

layout: true

# Integration Testing

---

for: alexa readme slides

Unit testing is simple to define:

--

A test that tests the smallest testable piece of code possible.

--

In our ruby projects, this is usually a method, or a single outcome of a method.

--

If the method branches, for example, with an `if` statement, a unit test for each branch is usually written.

---

for: alexa readme slides

Generally speaking, *integration tests* test multiple parts of your application at once, to ensure a complete process works properly.

--

For example, an integration test could test:

--

- user signup

--

- login / logout

--

- creating a resource

--

- updating a resource

--

- deleting a resource

---

for: alexa readme slides

Integration tests take much longer to run than unit tests.  Therefore it's wise to be judicious in what's tested, as a long running test suite can slow down development time.

--

Before I started teaching at Bitmaker, when I'd interview for a job, I'd often ask how long a company's test suite took to run. The answer was usually between 15 and 30 minutes.

---

for: alexa readme slides

With *rails*, the boundaries between `functional`, `system` and `integration` tests are a little confusing.

--

For our purposes, as we've included `capybara`, we'll be using a hybrid of `system` and `integration` tests, but calling them `integration` tests.

---

for: alexa readme slides

When we created our pages resource, an integration test file wasn't generated by default.

--

Let's generate that now:


```bash
$ rails g integration_test pages
```

---

for: slides

Open it up and uncomment the default truth test. Let's see if *guard* picks it up.

`/test/integration/pages_test.rb`

```ruby
require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
* test "the truth" do
*   assert true
* end
end
```

---

for: alexa readme slides

layout: true

# User Stories

---

for: alexa readme slides

Let's begin our app with:

--

- an index of pages can be viewed

--

- a single page can be viewed

--

- a page can be created

--

- a page can be updated

--

- a page can be deleted

--

Copy these stories over to `/test/integration/pages_test.rb` and create empty tests from them.


---

for: alexa readme slides

Our test file should look like this:

`/test/integration/pages_test.rb`

```ruby
require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test 'an index of pages can be viewed' do
  end

  test 'a single page can be viewed' do
  end

  test 'a page can be created' do
  end

  test 'a page can be updated' do
  end

  test 'a page can be deleted' do
  end

end
```

---

for: slides

Comment out all the tests except for the first one:

--

```ruby
require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test 'an index of pages can be viewed' do
  end

*  # test 'a single page can be viewed' do
*  # end

*  # test 'a page can be created' do
*  # end

*  # test 'a page can be updated' do
*  # end

*  # test 'a page can be deleted' do
*  # end

end
```

---

for: slide

Let's commit.

---

for: alexa readme slides

layout: true

# An index of pages can be viewed

---

for: alexa readme slides

Let's write a test for our first story.

---

for: alexa readme slides

We are going to use the TDD *RED-GREEN-REFACTOR* methodology.

--

### Red

Write a failing test for the story / feature we want.

--

We want to write the minimum amount of code possible to make the test fail.

--

### Green

Make the test pass by implmenting the feature.

--

### Refactor

Make the code nicer if possible.

---

for: slides

Sometimes the *Arrange-Act-Assert* model works for integration testing. Sometimes it doesn't.

For our `index`, it works well.

--

Let's start by adding comments for each section of the test:

```ruby
  test 'an index of pages can be viewed' do

*   # Arrange

*   # Act

*   # Assert

  end
```


---

for: slides

We'll need some pages to view on our index page. Let's set those up:

```ruby

  test 'an index of pages can be viewed' do

    # Arrange
*   Page.create(title: 'Page 1', slug: 'page-1')
*   Page.create(title: 'Page 2', slug: 'page-2')

    # Act

    # Assert

  end

```

--

Take a look at *guard* and verify our tests are still passing.

---

for: alexa readme

We'll need some Pages to view on our index page. Let's set those up:

```ruby

  test 'an index of pages can be viewed' do

    # Arrange
   Page.create(title: 'Page 1', slug: 'page-1')
   Page.create(title: 'Page 2', slug: 'page-2')

    # Act

    # Assert

  end

```

--

Take a look at *guard* and verify our tests are still passing.

---

for: alexa readme slides

To visit a page using the *Capybara DSL*
<small>(Domain Specific Language)</small>,<br>
use the `visit` method:<br>

```ruby
 visit 'pages'
 ```

--

This simulates visiting:

```
http://localhost:3000/pages
```



---

for: slides

Add this to our test:

```ruby
  test 'an index of pages can be viewed' do

    # Arrange
    Page.create(title: 'Page 1', slug: 'page-1')
    Page.create(title: 'Page 2', slug: 'page-2')

    # Act
*   visit 'pages'

    # Assert

  end
```

---

for: alexa readme

Add `visit 'pages'` this to our test.

---

for: alexa readme slides

Our test suite should now error.

--

Excellent!

--

We've just started the *RED* phase of *Red-Green-Refactor*.

---

for: slides

Examining the error should reveal that we need a *route* to handle this.

--

Let's add the minimum amount of code possible to fix this issue:

--

`/config/routes.rb`

--

```ruby
Rails.application.routes.draw do

* get 'pages' => 'pages#index'

end

```

--

... and now check *guard* for our test results ...

---

for: alexa readme

Add `get 'pages' => 'pages#index'` to `/config/routes.rb`.

---

for: alexa readme slides

Now our test is telling us that we need a *controller*.

--

Let's generate one:

--

```bash
$ rails g controller pages --skip-test-framework --skip-assets --skip-helper
```

---

for: alexa readme slides

Now our test is telling us that we need an `index` action.

--

Let's add one.

---

for: slides

`/app/controllers/pages_controller.rb`

```ruby
class PagesController < ApplicationController

* def index

* end

end
```

---

for: alexa readme

Add an `index` action to your pages controller.

---

for: alexa readme slides

Now our test is telling us that we need an `index` template.

--

Let's add one:

--

```bash
$ touch app/views/pages/index.html.erb
```

---

for: slides

Now our test is having an issue with turbolinks, because we removed this from our gemfile.

--

Let's fix that:

`/app/assets/javascript/application.js`

--

```js
// ...
//= require rails-ujs
*//= require turbolinks
//= require_tree .

```

Remove that line.

---

for: alexa readme

Remove `//= require turbolinks` from `/app/assets/javascript/application.js`.


---

for: alexa readme slides

And now our test should pass.

--

We've entered *Green*.

--

Let's add an *assert* now.

---

for: alexa readme slides

We should have a heading of "Your Pages" on top of our list of pages.

--

Use `assert_text` to check for text on a page.

---

for: slides

```ruby
  test 'an index of pages can be viewed' do

    # Arrange
    Page.create(title: 'Page 1', slug: 'page-1')
    Page.create(title: 'Page 2', slug: 'page-2')

    # Act
    visit 'pages'

    # Assert
*   assert_text 'Your Pages'

  end
```

---

for: alexa readme

Add `assert_text 'Your Pages'` to test.

---

And we're once again *red*.

---

for: alexa readme slides

Let's address this by adding the heading:

`/app/views/pages/index.html.erb`

```html
<h2>Your Pages</h2>
```

---

for: slides

Use `assert_select` to check for text on a page within a particular selector.

--

We're going to list our pages inside of a table, so let's use `assert_selector` here:

```ruby
  # ...

  # Assert
  assert_text     'Your Pages'
* assert_selector 'td', text: 'Page 1'
* assert_selector 'td', text: 'Page 2'
```

---

for: alexa readme

Use `assert_select` to check for text on a page within a particular selector.

In your test:

```ruby
assert_selector 'td', text: 'Page 1'
assert_selector 'td', text: 'Page 2'
```

---

for: alexa readme slides

And now add the code to fix the test:

`/app/views/pages/index.html.erb`

```html

<h2>Your Pages</h2>

*<table>
*  <% Page.all.each do |page| %>
*    <tr>
*      <td><%= page.title %></td>
*    </tr>
*  <% end %>
*</table>
```

--

Our first test is working!

---

for: alexa readme

And now add the code to fix the test:

```html
<h2>Your Pages</h2>

<table>
  <% Page.all.each do |page| %>
    <tr>
      <td><%= page.title %></td>
    </tr>
  <% end %>
</table>
```


---

for: alexa readme slides

Let's test this the old-fashioned way by adding some pages to our `seeds.rb` and using a web browser to view the index:

--

`/db/seeds.rb`

--

```ruby
# note that you would never put `destroy_all` in a
# regular rails app but we'll do it here for
# convenience as we're not building a real production app.

Page.destroy_all

# Create a few pages ...

Page.create!(
  title:   'Page 1',
  slug:    'page-1',
  content: 'Lorem Ipsum ... 111'
)

Page.create!(
  title:   'Page 2',
  slug:    'page-2',
  content: 'Lorem Ipsum ... 222'
)
```

--

Now seed your database.

---

for: alexa readme slides

Let's commit the code.

---

for: slides

layout: true

# Styles

---

for: alexa readme slides

Let's add a few stylesheets to spruce up our CMS.

---

for: alexa readme slides

layout: true

# Styles

`/app/assets/word-slinger.css`

---

for: alexa readme slides

--

```css

/* Elements */

body {
  background: bisque;
  padding: 0 1em;
  font-family: Arial, sans-serif;
}

nav {
  margin-bottom: 1em;
}

table {
  border-collapse: collapse;
}

td,th {
  border: green 2px solid;
  padding: 1em;
}
```

---

for: alexa readme slides

```css
/* Flash */

.flash {
  display: inline-block;
  padding: 1em;
  color: white;
}

#notice {
  background: green;
}

#alert {
  background: tomato;
}
```

---

for: alexa readme slides

```css
#errors {
  border: 4px solid tomato;
  display: inline-block;
}

#errors h4 {
  background: tomato;
  color: white;
  margin: 0;
  padding: 1em;
}

#errors ul {
  margin: 1em 1em 1em 0;
}

#errors li {
  color: darkred;
}
```

--

And commit.

---

for: alexa readme slides

layout: true

# A single page can be viewed

---

for: alexa readme slides

On to the next story!

---

for: alexa readme slides

Let's start out with the test code commented out. Then we'll uncomment each line one at a time, implement, and then uncomment the next line.

```ruby
test 'a single page can be viewed' do
#  Page.create(title: 'About Word Slinger', slug: 'about', content: 'Lorem Ipsum')
#  visit           'about'
#  assert_selector 'h2', text: 'About Word Slinger'
#  assert_selector 'p',  text: 'Lorem Ipsum'
end
```

--

When finished, commit and move on to the next story.

---

for: alexa readme slides

layout: true

# A page can be created

---

for: alexa readme slides

Uncomment one line at a time, implement the feature, then commit at the end:

```ruby
test 'a page can be created' do
  # visit           'pages/new'
  # assert_selector 'h2',          text: 'New Page'
  # fill_in         :page_title,   with: 'My new page'
  # fill_in         :page_slug,    with: 'my-new-page'
  # fill_in         :page_content, with: "My New Page's Content"
  # click_on        'Create Page'
  # assert_selector '#notice',     text: 'Page saved!'
  # assert_equal    '/pages',      current_path
  # assert_selector 'td' ,         text: 'My new page'
  # visit           'my-new-page'
  # assert_text     "My New Page's Content"
end
```
---

for: alexa readme slides

layout: true

# A page can be updated

---

for: alexa readme slides

Uncomment one line at a time, implement the feature, then commit at the end:

```ruby
test 'a page can be updated' do
  # page_to_update = Page.create(title: 'My Existing Page', slug: 'my-existing-page')
  # visit            "pages/#{page_to_update.id}/edit"
  # assert_selector  'h2',                      text: "Update #{page_to_update.title} Page"
  # fill_in          :page_title,               with: 'My Updated Page Title'
  # fill_in          :page_slug,                with: 'my-new-page-slug'
  # click_on         'Update Page'
  # assert_selector  '#notice',                 text: 'Page saved!'
  # assert_equal     '/pages', current_path
  # assert_selector  'td' ,                     text: 'My Updated Page Title'
  # page_to_update.reload
  # visit            page_to_update.slug
  # assert_selector  'h2' ,                     text: 'My Updated Page Title'
  # assert_equal     '/' + page_to_update.slug, current_path
end
```

---

for: alexa readme slides

layout: true

# A page can be deleted

---

for: alexa readme slides

Uncomment one line at a time, implement the feature, then commit at the end:

```ruby
test 'a page can be deleted' do
  #  page_to_delete = Page.create(title: 'My Page I Want To Delete',        slug: 'my-existing-page')
  #                   Page.create(title: 'My Page I Do Not Want To Delete', slug: 'my-page-to-keep')
  #
  #  visit pages_path
  #  find("a[href='/pages/#{page_to_delete.id}']").click
  #  assert_equal     "/pages",  current_path
  #  assert_selector  '#notice', text: 'Page deleted!'
  #  assert_no_text   page_to_delete.title
end
```

---

for: alexa readme slides

layout: true

# Tips

---

for: alexa readme slides

Testing tips:

--

- `save_and_open_page`

--

- remember, implement the smallest amount of code possible, test, and then repeat

--

- don't commit code when tests are failing

--

- commit early, commit often! (when tests are passing, of course)

--

- if you go *red*, and you're not sure why, back out until your tests are *green* and then try again.

--

- use `command-z` or `ctrl-z` to back out. Don't try to manually "Undo".

--

- if you can't undo, use  `git stash` to restore to the last place when tests were passing

---


for: alexa readme slides

layout: true

# More User Stories

---

for: alexa readme slides

What other user stories can we implement?

--

- a visitor can visit the homepage
- a visitor receives a 404 for an invalid page
- an admin can login
- an admin can logout
- a non-admin cannot create a page
- a non-admin cannot delete a page
- a non-admin cannot update a page

---

for: readme slides

layout: true

# Recap and Resources

---

for: readme slides

## A Guide to Testing Rails Applications
[http://guides.rubyonrails.org/testing.html](http://guides.rubyonrails.org/testing.html)

## Capybara
[https://github.com/teamcapybara/capybara](https://github.com/teamcapybara/capybara)

---

for: readme slides

## Guard
[https://github.com/guard/guard](https://github.com/guard/guard)

--

## Guard::Minitest
[https://github.com/guard/guard-minitest](https://github.com/guard/guard-minitest)

