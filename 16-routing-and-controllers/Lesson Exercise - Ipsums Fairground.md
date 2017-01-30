# Today's Lesson's Exercise: **Ipsum's Fairground**

- We'll make an app for **Ipsum's Fairground**.
- It'll be basic CRUD Web Application with details about each ride.

---
# New Rails App

### Terminal:

```shell
rails new RideApp
cd RideApp
rails server
```

### Browser:

```
http://localhost:3000/
```

- You should the default **Yay! You're on Rails! page**.
- This page is the default until you define a route for the root of you website.

# Restarting Rails

## Generally, unlike Sinatra, Rails does not need a restart when these files are changed:

- anything inside of `/app` (models, view controllers, assets, etc.)
- `routes.rb`

## Generally, Rails does need a restart when:

- `Gemfile`
- `/initializers/*`
- `/config/*` (except for `routes.rb`)

---
# Routing

Use the `rails routes` command to see what routes are configured.

### Terminal
```shell
rails routes
```

Let's see what happens when we try to go to a path.

### Browser:

```
http://localhost:3000/about
```

Now we'll configure our first route.

### Editor:

```ruby
# /config/routes.rb

Rails.application.routes.draw do
  get '/about', to: 'rides#about'
end
```

- `get '/about', to: 'rides#about'` means when `about` is the path (after the domain), go to the `RidesController` and call the `def about` method

- Let's see if our route exists now.

### Terminal:
```shell
rails routes
```

- A controller action is a method

- Let's test in our browser.

### Browser:

```
http://localhost:3000/about
```

- No more routing error. 
- Now what's the problem?

---
# Controllers

Let's create a controller.

### Terminal:
```shell
rails generate controller Rides
```

Now we'll add an `about` method to handle the route we created.

### Editor:

```ruby
# /app/controllers/rides_controller.rb

class RidesController < ApplicationController
  def about
    render text: "Welcome to Ipsum's Fair!  Come for our rides, stay for our hotdogs."
  end
end
```

### Browser:

```
http://localhost:3000/about
```

---
# Lorem Ipsum

Useful when you need filler text.

### Browser:

```
http://www.lipsum.com/
```

You can generate paragraphs or sentences.

# Lorem Ride

First let's check our routes before we add one.

### Terminal:
```shell
rails routes
```

Then we'll add our route and save our file.

### Editor:

```ruby
# /config/routes.rb
...
  get '/lorem', to: 'rides#lorem_ride'
...  
```

Now let's see if the route we just added exists:

### Terminal:
```shell
rails routes
```

- Notice that our new route's path `lorem` is different than the action name `lorem_ride` (unlike our first `about` route)

- What URL do we put into our browser to get this new route?

### Browser:

```
http:// What url goes here?
```

---

### Editor:


```ruby
# /app/controllers/rides_controller.rb

class RidesController < ApplicationController
...  
  def lorem_ride
    render text: '???' # we need to generate some lorem ipsum text
  end
end
```

I'll generate 10 words and add it to my text for the lorem ride.

### Browser:

```
http://www.lipsum.com/
```

---


Now let's test in our browser.

### Browser:

```
http://localhost:3000/lorem
```

## Your Turn

Add two more routes and controller methods using Ipsum generators from this list I'll post to slack.

### Browser:

```
http://mashable.com/2013/07/11/lorem-ipsum/#47xbLkuhAqqV
```

I can help people now who are stuck.

---

Now I'll catch-up to where you're at.

### Editor:

```ruby
# /config/routes.rb

...
  get '/bacon', to: 'rides#bacon_ride'
  get '/hodor', to: 'rides#game_of_thrones_ride'
...
```


```ruby
# /app/controllers/rides_controller.rb

...  
  def bacon_ride
    render text: 'Bacon ipsum dolor amet pastrami alcatra kevin ribeye turkey, spare ribs shank jerky.'
  end

  def game_of_thrones_ride
    render text: 'Hodor, hodor; hodor HODOR hodor, hodor hodor? Hodor hodor - hodor...'
  end
...
```

---
# Root

- Let's make a homepage for our site.
- We use the method `root` to mean nothing after the domain (i.e. no path).
- This time I'm not going to render plain text, but rather render a template.

### Editor:

```ruby
# /config/routes.rb
...
  root to: 'rides#home'
...  
```

### Browser:

```
http://localhost:3000/
```

- We don't need to explicitly create a controller action if there's nothing in the controller action to do. Just by creating a template, a controller action is implicitly created.

- Let's create our template.


### Terminal:

```shell
touch app/views/rides/home.html.erb
```

### Editor:

```html
# app/views/rides/home.html.erb

<h1>Welcome to the Ipsum Fair</h1>
```

---
# Passing Parameters Using The Routes

### Editor:

```ruby
# /config/routes.rb
...
  get 'rides/:ride_name', to: 'rides#show'
...  
```

### Browser:

```
http://localhost:3000/rides/lorem
```

`lorem` is the parameter we're passing into our controller

### Editor:


```ruby
# /app/controllers/rides_controller.rb
...  
  def show
    render html: params.inspect
  end
...
```

`inspect` is a ruby method you can call on any object to open it up and look inside. It's very useful for debugging.

### Browser:

```
http://localhost:3000/rides/lorem
```

### Editor:

```ruby
# /app/controllers/rides_controller.rb
...  
  def show
    render text: "Your Ride is '#{params[:ride_name]}'"
  end
...
```

### Browser:

```
http://localhost:3000/rides/lorem
```

Let's try a different parameter.

### Browser:

```
http://localhost:3000/rides/apple_banana
```

What happens if I remove the word `rides`?

### Browser:

```
http://localhost:3000/apple_banana
```

Let's go back to our original `lorem` ride.

### Browser:

```
http://localhost:3000/rides/lorem
```

Let's take away `render text` from our show.

### Editor:

```ruby
# /app/controllers/rides_controller.rb
...  
  def show
  end
...
```

### Browser:

```
http://localhost:3000/rides/lorem
```

- Rails impliciately tries to render a template for 'show'.
- Where are templates stored?

### Terminal:

```shell
touch app/views/rides/show.html.erb
```

### Editor:

```html
# app/views/rides/show.html.erb

<h1>I am the show!</h1>
```

### Browser:

```
http://localhost:3000/rides/lorem
```

What will happen if we change the ride name and refresh the browser?

### Browser:

```
http://localhost:3000/rides/cat-mouse-dog-ride
```

Let's pass our ride name to the view.

### Editor:

```ruby
# /app/controllers/rides_controller.rb
...  
  def show
    @ride_name = params[:ride_name]
  end
...
```

What do we have to do to display the ride name in the view?

### Editor:

```html
# app/views/rides/show.html.erb

<h1>Welcome to the <%= @ride_name %> Ride!</h1>
```

Let's do this using a more conventional way.

### Editor:
```ruby
# /config/routes.rb
...
  get '/rides/:id', to: 'rides#show'
...
```

Now how do I get the Ride Name?

### Editor:

```ruby
# /app/controllers/rides_controller.rb
...  
  def show
    @ride_name = params[:id]
  end
...
```

Test.

### Browser:

```
http://localhost:3000/rides/cat-mouse-dog-ride
```


Let's move our Lorem Ipsum text to be retrieved by the show.

### Editor:
```ruby
# /app/controllers/rides_controller.rb
...  
  def show
    @ride_name = params[:id]
    @description = case @ride_name
                  when 'lorem'
                    lorem_ride
                  when 'bacon'
                    bacon_ride                    
                  when 'hodor'
                    game_of_thrones_ride
                  else
                    "We don't have that ride, sorry."
                  end
  end
...

  private
    
  def bacon_ride
    'Bacon ipsum dolor amet pastrami alcatra kevin ribeye turkey, spare ribs shank jerky.'
  end

  def game_of_thrones_ride
    'Hodor, hodor; hodor HODOR hodor, hodor hodor? Hodor hodor - hodor...'
  end
  
  def lorem_ride
    '???'
  end
```


### Browser:

```
http://localhost:3000/rides/lorem
```

What do I need to put in my view template to show both the name and description?

### Editor:

```html
# app/views/rides/show.html.erb

<h1><%= @ride_name %> Ride</h1>
<p><%= @description %></p>
```

### Browser:

```
http://localhost:3000/rides/bacon
```

### Browser:

```
http://localhost:3000/rides/hodor
```

### Browser:

```
http://localhost:3000/rides/are-you-for-real
```

# Several Parameters

### Editor:

```ruby
# /config/routes.rb
...
  get '/funfun/:name/:age/:weight/please', to: 'rides#funfun'
...
```

What of the new route are parameters?

### Editor:
```ruby
# /app/controllers/rides_controller.rb
...
  def funfun
    render text: "Welcome #{params[:name]}! You are #{params[:age]} years old. You weigh #{params[:weight]} pounds. Not bad."
  end
...
```

Which of the following will match?

### Browser:

```
http://localhost:3000/funfun/bernie/80/300/please
http://localhost:3000/funfun/bernie/80/300/thankyou
http://localhost:3000/funfun/melissa/20/100/please
http://localhost:3000/funfun/:melissa/80/300/please
```

Let's remove this funfun route.

### Editor:


```ruby
# /config/routes.rb
...
  <snip>
...  

```

```ruby
# /app/controllers/rides_controller.rb
...
  <snip>
...  

```

---
# Index

### Editor:

```ruby
# /config/routes.rb
...
  get '/rides', to: 'rides#index'
...  

```

```ruby
# /app/controllers/rides_controller.rb
...
  def index
    @rides = { lorem: lorem_ride, bacon: bacon_ride, hodor: game_of_thrones_ride }
  end
...  

```

```html
# /app/views/index.html.erb

<h1>Rides We Have</h1>

<% @rides.each do |ride_name, ride_description| %>
  <h2><%= ride_name %></h2>
  <p><%= ride_description %></p>
<% end %>
```

# New / Create

### Editor:

```ruby
# /config/routes.rb

...
  get 'rides/new', to: 'rides#new'
  post 'rides', to: 'rides#create'
...  

```

```ruby
# /app/controllers/rides_controller.rb

...
  def new
    # Code to display the new form
  end
  
  def create
    # Code to create a new ride
    redirect_to rides_path
  end  
...  

```


```html
# /app/views/new.html.erb

<h1>Add New Ride</h1>

<%= form_tag rides_path do %>
  Imagine a new ride form here.<br>
  <%= submit_tag 'Save New Ride' %>
<% end %>
```


---
# Edit / Update

### Editor:

```ruby
# /config/routes.rb

...
  get 'rides/edit', to: 'rides#edit'
  put 'rides', to: 'rides#update'
...  

```

```ruby
# /app/controllers/rides_controller.rb

...
  def edit
    # Code to display the edit form
  end
  
  def update
    # Code to update the ride
    redirect_to rides_path
  end  
...  

```


```html
# /app/views/edit.html.erb

<h1>Edit Existing Ride</h1>

<%= form_tag rides_path do %>
  Imagine an edit ride form here.<br>
  <%= submit_tag 'Save Ride' %>
<% end %>
```


---
# Delete

### Editor:

```ruby
# /config/routes.rb

...
  delete 'ride', to: 'rides#destroy'
...  

```


```ruby
# /app/controllers/rides_controller.rb

...
  def destroy
    # Code to destroy a record
    redirect_to rides_path
  end
...  

```

# Resourceful Routing

let's use the Rails shortcut to create these routes

### Editor:

```ruby
# /config/routes.rb
...
  resources :rides
...  
```

### Terminal:
```shell
rails routes
```

---
# Cities

Our fair has expanded to more than one city!

## Your Turn

Create routes for your cities

## Controller

What happens when we try to go to our cities routes in our browser?
Let's create a controller for our cities.

### Terminal:
```shell
rails generate controller Cities
```

- Now what happens when we try to go to our cities routes in our browser?
- Where are our controller actions?
- if you have time: create views for your cities.

---

# Path and URL Helpers

### Terminal
```shell
rails routes
```

- We are using the index path helper in our controller.

# Filters

- Use `before_action` to run the same method on multiple actions

### Editor:

```ruby
# /app/controllers/rides_controller.rb
...

  before_action :set_title
  
...

  private
  
  def set_title
    @title = 'Ipsum fair!'
  end
...  

```

Now let's put that title in our layout.

# ApplicationController

- If I try to pull up a city, I don't get a page title.
- Our controllers are subclasses of the ApplicationController, so I could move the `before_action` to the application controller so that all actions execute the `before_action`

### Editor:

```ruby
# /app/controllers/application_controller.rb
...

  before_action :set_title
  
...

  private
  
  def set_title
    @title = 'Ipsum fair!'
  end
...  

```

# Filter Specifity

- We can also just execute the before_action on certain methods.
- I'll set this `before_action` to only execute on the new, create, edit, update & delete

### Editor:

```ruby
# /app/controllers/application_controller.rb
...
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :delete]
...

```
