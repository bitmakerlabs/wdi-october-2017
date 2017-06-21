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
http://localhost:3000
```

- You should the default **Yay! You're on Rails! page**.
- This page is the default until you define a route for the root of you website.

# Restarting Rails

Unlike Sinatra, Rails does not need a restart when most files are changed.

**Rails does not need a restart when the following are changed:**

- anything inside of `/app` (models, view controllers, assets, etc.)
- `config/routes.rb`

**Rails does need a restart when the following are changed:**

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
# config/routes.rb

Rails.application.routes.draw do
  get 'about' => 'rides#about'
end
```

- `get 'about' => 'rides#about'` means when `about` is the path (after the domain), go to the `RidesController` and call the `def about` method

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
rails generate controller rides
```

What happens when we try the website now?

### Browser:

```
http://localhost:3000/about
```

Add an `about` method to handle the route we created.

### Editor:

```ruby
# app/controllers/rides_controller.rb

class RidesController < ApplicationController
  def about
    render plain: "Welcome to Ipsum's Fair!  Come for our rides, stay for our hotdogs."
  end
end
```

### Browser:

```
http://localhost:3000/about
```

---
# Lorem Ipsum

Lorem Ipsum is useful as filler text.

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
# config/routes.rb
...
  get 'lorem' => 'rides#lorem_ride'
...  
```

Now let's see if the route we just added exists:

### Terminal:
```shell
rails routes
```

Notice that our new route's path `lorem` is different than the action name `lorem_ride` (unlike our first `about` route)

What URL do we put into our browser to get this new route?

### Browser:

```
http:// What url goes here?
```

---

### Editor:


```ruby
# app/controllers/rides_controller.rb

class RidesController < ApplicationController
...  
  def lorem_ride
    render plain: '???' # we need to generate some lorem ipsum text
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

Add two more routes and controller methods using Ipsum generators from this blog post:

[http://mashable.com/2013/07/11/lorem-ipsum](http://mashable.com/2013/07/11/lorem-ipsum)


I can help people now who are stuck.

<br>

---

## My Turn

Now I'll catch-up to where you're at.

### Editor:

```ruby
# config/routes.rb

...
  get 'bacon' => 'rides#bacon_ride'
  get 'hodor' => 'rides#game_of_thrones_ride'
...
```


```ruby
# app/controllers/rides_controller.rb

...  
  def bacon_ride
    render plain: 'Bacon ipsum dolor amet pastrami alcatra kevin ribeye turkey, spare ribs shank jerky.'
  end

  def game_of_thrones_ride
    render plain: 'Hodor, hodor; hodor HODOR hodor, hodor hodor? Hodor hodor - hodor...'
  end
...
```

<br>

---
# Root

- Let's make a homepage for our site.
- We use the method `root` to mean nothing after the domain (i.e. no path).
- This time I'm not going to render plain text, but rather render a template.

### Editor:

```ruby
# config/routes.rb
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
<!-- app/views/rides/home.html.erb -->

<h1>Welcome to the Ipsum Fair</h1>
```

---
# Passing Parameters Using The Routes

### Editor:

```ruby
# config/routes.rb
...
  get 'rides/:ride_name' => 'rides#show'
...  
```

### Browser:

```
http://localhost:3000/rides/lorem
```

`lorem` is the parameter we're passing into our controller

### Editor:


```ruby
# app/controllers/rides_controller.rb
...  
  def show
    render html: params.inspect
  end
...
```

`inspect` is a ruby method you can call on any object to open it up and look inside. It's useful for debugging.

### Browser:

```
http://localhost:3000/rides/lorem
```

### Editor:

```ruby
# app/controllers/rides_controller.rb
...  
  def show
    render plain: "Your Ride is '#{params[:ride_name]}'"
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

Let's take away the `render plain` line from our `show`.

### Editor:

```ruby
# app/controllers/rides_controller.rb
...  
  def show
  end
...
```

### Browser:

```
http://localhost:3000/rides/lorem
```

- Rails impliciately tries to render a template for `show`.
- Where are templates stored?

### Terminal:

```shell
touch app/views/rides/show.html.erb
```

### Editor:

```html
<!-- app/views/rides/show.html.erb -->

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
# app/controllers/rides_controller.rb
...  
  def show
    @ride_name = params[:ride_name]
  end
...
```

What do we have to do to display the ride name in the view?

### Editor:

```html
<!-- app/views/rides/show.html.erb -->

<h1>Welcome to the <%= @ride_name %> Ride!</h1>
```

Let's do this using a more conventional way:

### Editor:
```ruby
# config/routes.rb
...
  get 'rides/:id' => 'rides#show'
...
```

Now how do I get the Ride Name?

### Editor:

```ruby
# app/controllers/rides_controller.rb
...  
  def show
    @ride_name = params[:id]
  end
...
```

### Browser:

```
http://localhost:3000/rides/cat-mouse-dog-ride
```


Let's move our Lorem Ipsum text to be retrieved by the show.

### Editor:
```ruby
# app/controllers/rides_controller.rb
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

  def lorem_ride
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  end
    
  def bacon_ride
    'Bacon ipsum dolor amet pastrami alcatra kevin ribeye turkey, spare ribs shank jerky.'
  end

  def game_of_thrones_ride
    'Hodor, hodor; hodor HODOR hodor, hodor hodor? Hodor hodor - hodor...'
  end
  
```


### Browser:

```
http://localhost:3000/rides/lorem
```

What do I need to put in my view template to show both the name and description?

### Editor:

```html
<!-- app/views/rides/show.html.erb -->

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

<br>

---
# Index

### Editor:

```ruby
# config/routes.rb
...
  get 'rides' => 'rides#index'
...  

```

```ruby
# app/controllers/rides_controller.rb
...
  def index
    @rides = { lorem: lorem_ride, bacon: bacon_ride, hodor: game_of_thrones_ride }
  end
...  

```

```html
<!-- app/views/rides/index.html.erb -->

<h1>Rides We Have</h1>

<% @rides.each do |ride_name, ride_description| %>
  <h2><%= ride_name %></h2>
  <p><%= ride_description %></p>
<% end %>
```

# New / Create

### Editor:

```ruby
# config/routes.rb

...
  get 'rides/new' => 'rides#new'
  post 'rides' 	 => 'rides#create'
...  

```

```ruby
# app/controllers/rides_controller.rb

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
<!-- app/views/rides/new.html.erb -->

<h1>Add New Ride</h1>

<%= form_tag rides_path do %>
  Imagine a new ride form here.
  <br><br>
  <%= submit_tag 'Save New Ride' %>
<% end %>
```


---
# Edit / Update

### Editor:

```ruby
# config/routes.rb
...
  get   'rides/:id/edit' => 'rides#edit'
  patch 'rides'          => 'rides#update'
...  

```

```ruby
# app/controllers/rides_controller.rb
...
  def show
    get_name_and_description
  end
...  
  def edit
    get_name_and_description
  end
  
  def update
    # Code to update the ride
    redirect_to rides_path
  end  
...
  def get_name_and_description
    @ride_name = params[:id]

    @description =
      case @ride_name
        when 'lorem'
          lorem_ride
        when 'bacon'
          bacon_ride
        when 'hodor'
          game_of_thrones_ride
        else
          "Sorry, we don't have that ride."
        end
  end
...

```


```html
<!-- app/views/rides/edit.html.erb -->

<h1>Edit <%= @ride_name %> Ride</h1>

<%= form_tag rides_path do %>
  Imagine an edit ride form here.
  <br><br>
  <%= submit_tag 'Save Ride' %>
<% end %>
```


---
# Delete

### Editor:

```ruby
# config/routes.rb

...
  delete 'ride' => 'rides#destroy'
...  

```


```ruby
# app/controllers/rides_controller.rb

...
  def destroy
    # Code to destroy a record
    redirect_to rides_path
  end
...  

```

# Resourceful Routing

Let's use resourceful routing to create these routes instead.

### Terminal:
```shell
rails routes
```

### Editor:

```ruby
# config/routes.rb
...
  resources :rides
...  
```

### Terminal:
```shell
rails routes
```

