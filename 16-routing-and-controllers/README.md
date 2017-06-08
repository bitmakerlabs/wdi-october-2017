# Routing and Controllers - Introduction

Today we'll take our first deep dive into Rails and learn about Routing and Controllers.

---

## Agenda

- #### Introduction <small>(5 min)</small>
  - Intro
  - Agenda
  - Overview

- #### Routing <small>(25 min)</small>
  - Static Segments
  - Dynamic Segments
  - Path Helpers
  - How To Display Routes
  - Resource Routing

- #### Controllers <small>(35 min)</small>
  - CRUD
  - Seven Controller Methods: Overview
  - Views
  - Params Hash
  - Seven Controller Methods: In-depth
  <ul>
    - Index
    - Show
    - New
    - Create
    - Edit
    - Update
    - Destroy
  </ul>
  
- #### Wrap-up <small>(5 min)</small>
  - Recap
  - Further Resources

- #### Lesson Exercise: Ipsum's Fairground <small>(remaining time)</small>
  - Let's create a Rails App!

<br>

---

## Overview

When an http request hits a Rails app, the **Router** analyzes the request and decides which **Controller** it will direct it to.

The **Controller** works with any **Models** necessary, and then renders the appropriate **View**.

<br>

---

# Routing

Routes are defined in `config/routes.rb`.

The router looks at **http request method** and **path** of the request, and then using pattern matching, calls the appropriate **controller** and **action** (ruby method).

## Example

A visitor looking for details on a particular product goes to `http://store.com/products/55` with their web browser.

We have the following route defined:

```ruby
# config/routes.rb

Rails.application.routes.draw do

  get 'products/:id' => 'products#show'

end
```

This routes matches the request like so:

- `get` - matches the ***http request method***.
- `/products/` - matches **/products/** in http://store.com/products/55
- `:id` - as it starts with a colon `:`, it's a wildcard match and will match anything. Therefore it matches **55** in http://store.com/products/55

It then sends that request to:

- `products` - the **Products**Controller
- `show` - the **show** action (ruby method) in the ProductsController

Inside of the Products Controller:

```ruby
# app/controllers/products_controller.rb

class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

end
```

The show method finds the product and then renders and returns the view.

## Static Segments

Anything static (not prefixed with a **colon**) must be matched exactly for its route to take effect.

In the following example:

```ruby
get '/products/:id' => 'products#show'
```

`products` is a static segment.

## Dynamic Segments

Anything dynamic (prefixed with a **colon**) can match on *anything*:

In the following example:

```ruby
get '/products/:id' => 'products#show'
```

`:id` is a dynamic segment, and the following would be legitimate matches:

```bash
http://localhost:3000/products/333
http://localhost:3000/products/spiderman_comic
```

For:

```bash
http://localhost:3000/products/333
```

`:id` captures `333`

For:

```bash
http://localhost:3000/products/spiderman_comic
```

`:id` captures `spiderman_comic`


## Path Helpers

Along with deciding how it will dispatch an http request, the router can create Path and URL helpers that can be used in Controllers and Views.

For example, if we add `as: 'product'` to the end of our route like so:

```ruby
# config/routes.rb
get 'products/:id' => 'products#show', as: 'product'
```

We will be able to use the following methods to generate a links to the product:

`product_path(55)` generates `/products/55`


## Displaying Routes

To see what routes currently exist in your application, use the following from the command line:

```bash
rails routes
```

For our products example above, we would see the following:

```bash
Prefix   Verb  URI Pattern    Controller#Action
product  GET   /products/:id  products#show
```

## Resource Routing

Shorthand for creating the standard routes is called Resourceful Routing:

```ruby
# config/routes.rb

resources :products
```

is the equivalent of:

```ruby
# config/routes.rb
get    'products'          => 'products#index',  as: 'products'
post   'products'          => 'products#create'
get    'products/new'      => 'products#new',    as: 'new_product'
get    'products/:id'      => 'products#show',   as: 'product'
get    'products/:id/edit' => 'products#edit',   as: 'edit_product'
patch  'products/:id'      => 'products#update'
delete 'products/:id'      => 'products#destroy'
```

## Root

To direct a url without a path (aka the `root` path), use:

```ruby
root to: 'products#index'
```

If your url is `localhost:3000`, then this would direct
`http://localhost:3000/` to the `index` method in the `ProductsController`.

<br>

---

# Controllers

## CRUD

When we think about data and how we manipulate it, we use the acronym CRUD to describe what we can do with this data:

- **C**reate a record
- **R**ead a record
- **U**pdate a record
- **D**elete a record

You'll hear developers say things like "Oh ya, it's just a basic **CRUD** app." (and one day, you'll say it too).


## Seven Controller Methods - Overview

A standard controller will have the following methods:

Controller Method | HTTP Request Method | Description
----------------- | ------------------- | -----------
index | get | request that retrieves a collection of records
show | get | request that retrieves a single record
new | get | request to pull up a form for a new record
create | post | request that handles the submission of a form to create a new record
edit | get | request to pull up a form for an existing record
update | patch | request handles the submission of a form to update an existing record
destroy | delete | request to remove a single record


## Views

For `get` requests, the **controller** will implicitly try to render (process and send back as html) a template in a folder named after the controller, and a file named after the method.

For example, a `ProductsController` will try to render the following:


```ruby
class ProductsController < ApplicationController

  def show
   # renders app/views/products/show.html.erb
  end

  def index
   # renders app/views/products/index.html.erb
  end

  def new
   # renders app/views/products/new.html.erb
  end

  def edit
   # renders app/views/products/edit.html.erb
  end

end
```


## Params Hash

Information about the http request will be accessible via the **Params Hash**.

It will contain:

- form data from a `post` or `patch` request
- dynamic segment route matches in url. For example:

```ruby
get 'products/:id' => 'products#show'
```

would match the route:

`http://localhost:3000/products/333`

and would make `{ id: 333 }` accessible via the params hash:

```ruby
params[:id]  # returns 333
```


## Seven Controller Methods - In-depth

### Index

For retrieving a collection of items.

```ruby
def index
  @products = Product.all
end
```

Notice how `@products` is pluralized. This is because it's a collection (more than 1) of all the products.

### Show

For retrieving a single item.

```ruby
def show
  @product = Product.find(params[:id])
end
```

Notice how `@product` is singular. This is because it's only one item.

### New

For retrieving a form for a new item.

```ruby
def new
  @product = Product.new
end
```

We setup a `new` product and store it inside the `@product` **instance variable**. Note that this `product` hasn't yet been saved to the database.

### Create

For processing a **post** request to create a new item:

```ruby
def create
  @product = Product.new
  @product.name = params[:product][:name]
  @product.description = params[:product][:description]
  @product.price = params[:product][:price]

  if @product.save
    flash.notice = 'Product successfully created!'
    redirect_to products_url
  else
    flash.alert = 'Product could not be created. Please correct and try again.'
    render 'new'
  end
end
```

If `@product` successfully saves, it will now be stored permanently in the database.

If `@product` doesn't save, the form will be displayed again. It will contain validation errors and the fields filled out from the previous submission.

### Edit

For retrieving a form for an existing item.

```ruby
def edit
  @product = Product.find(params[:id])
end
```

This loads the product from the database and stores its current state inside the `@product` **instance variable**. Note that the **edit** method does not yet save the changes to `@product`.

### Update

For processing a **patch** request to update an existing item:

```ruby
def update

  @product = Product.find(params[:product][:id])
  @product.name = params[:product][:name]
  @product.price = params[:product][:price]

  if @product.save
    flash.notice = 'Product successfully updated!'
    redirect_to product_url(@product)
  else
    flash.alert = 'Product could not be updated. Please correct and try again.'
    render 'edit'
  end

end
```

If the `product` successfully saves with the altered values from the form, the changes will now be stored permanently in the database.

### Destroy

For removing a an item from the database.

```ruby
def destroy
  @product = Product.find(params[:id])
  @product.destroy!
  flash.notice = 'Product successfully deleted.'
  redirect_to products_url
end
```

<br>

---

## Recap and Further Resources

#### Rails Guides: Rails Routing from the Outside In:<br>[http://guides.rubyonrails.org/routing.html](http://guides.rubyonrails.org/routing.html)

#### Rails Guides: Action Controller Overview:<br>[http://guides.rubyonrails.org/action_controller_overview.html](http://guides.rubyonrails.org/action_controller_overview.html)

<br>

---

## Lesson Exercise: Ipsum's Fairground 

Let's create a Rails App!

Open [ipsums-fairground.html](ipsums-fairground.html)

