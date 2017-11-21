# Routing and Controllers - An Introduction

Today we'll take our first deep dive into Rails and learn about Routing and Controllers.

# Agenda

### Introduction <small>(5 min)</small>
  - Intro
  - Agenda
  - Overview

### Routing <small>(25 min)</small>
  - Static Segments
  - Dynamic Segments
  - Path Helpers
  - How To Display Routes
  - Resource Routing

### Controllers <small>(35 min)</small>
  - CRUD
  - Seven Controller Methods: Overview
  - Views
  - Params Hash
  - Seven Controller Methods: In-depth
    - Index
    - Show
    - New
    - Create
    - Edit
    - Update
    - Destroy

### Wrap-up <small>(5 min)</small>
  - Recap
  - Further Resources

### Lesson Exercise: Ipsum's Fairground <small>(remaining time)</small>
  - Let's create a Rails App!

## Overview

When an http request hits a Rails app, the **Router** analyzes the request and decides which **Controller** it will direct it to.

The **Controller** works with any **Models** necessary, and then renders the appropriate **View**.

![](slides/Ruby-on-Rails-Request-Response-Cycle-big.png)

# Routing

Routes are defined in `config/routes.rb`.

The router looks at the **http request method** and **path** of the request, and then using pattern matching, calls the appropriate **controller** and **action** (ruby method).

# Routing Example

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

# Routing - Static Segments

Anything static (not prefixed with a **colon**) must be matched exactly for its route to take effect.

In the following example:

```ruby
get '/products' => 'products#index'
```

`products` is a static segment.

# Routing - Dynamic Segments

Anything dynamic (prefixed with a **colon**) can match on *anything*.

In the following example:

```ruby
get '/products/:id' => 'products#show'
```

`:id` is a dynamic segment.

The following would be legitimate matches:

```bash
http://localhost:3000/products/333
http://localhost:3000/products/spiderman_comic
```

Our route:

```ruby
get '/products/:id' => 'products#show'
```

The URL sent by the browser:

```bash
http://localhost:3000/products/333
```

`:id` captures `333`

Our route:

```ruby
get '/products/:id' => 'products#show'
```

The URL sent by the browser:

```bash
http://localhost:3000/products/spiderman_comic
```

`:id` captures `spiderman_comic`

# Path Helpers

Along with deciding how it will dispatch an http request, the router can create Path and URL helpers that can be used in Controllers and Views.

For example, if we add `as: 'product'` to the end of our route like so:

```ruby
# config/routes.rb
get 'products/:id' => 'products#show', as: 'product'
```

We will be able to use the following methods in our views and controllers to generate a links to the product:

`product_path(55)` generates `/products/55`

# Displaying Routes

To see what routes currently exist in your application, use the following from the command line:

```bash
rails routes
```

For our products example above, we would see the following:

```bash
Prefix   Verb  URI Pattern    Controller#Action
product  GET   /products/:id  products#show
```

# Resource Routing

Shorthand for creating the standard routes is called Resourceful Routing.

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

# Root

To direct a url without a path (aka the `root` path), use:

```ruby
root 'products#index'
```

If your url is `localhost:3000`, then this would direct
`http://localhost:3000/` to the `index` method in the `ProductsController`.

# Controllers

## CRUD

When we think about data and how we manipulate it, we use the acronym CRUD to describe what we can do with this data:

- **C**reate a record

- **R**ead a record

- **U**pdate a record

- **D**elete a record

You'll hear developers say things like "Oh ya, it's just a basic **CRUD** app." (and one day, you'll say it too).

# Seven Controller Methods - Overview

A standard controller will have the following methods:

```
             HTTP
Controller  Request
  Method    Method    Description
==========  =======   ===========
index       get       retrieves a collection of records
show        get       retrieves a single record
new         get       pull up a form for a new record
create      post      handles the submission of a form to create
edit        get       pull up a form for an existing record
update      patch     handles the submission of a form to update
destroy     delete    remove a single record

```

# Views

For `get` requests, the **controller** will implicitly try to render (create html) from a template in a folder named after the controller, and a file named after the method.

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

# Params Hash

Information about the http request will be accessible via the **Params Hash**.

It will contain:

- form data from a `post` or `patch` request

- dynamic segment route matches in url. For example:

For example:

```ruby
get 'products/:id' => 'products#show'
```

would match the route:

`http://localhost:3000/products/333`

and would make `{ id: 333 }` accessible via the params hash:

```ruby
params[:id]  # returns 333
```

# Seven Controller Methods - In-depth

### Index

For retrieving a collection of items.

```ruby
def index
  @products = Product.all
end
```

Notice how `@products` is pluralized. This is because it's a collection (zero, one, two or more) of all the products.

Pluralizing variable names for collections is a convention. Technically, a variable name for a collection can be singular, but your code will be easier to read and reason about if you pluralize it.

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

### Create:

For processing a **post** request to create a new item.

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

<small>
If `@product` successfully saves, it will now be stored permanently in the database.
<br>
If `@product` doesn't save, the form will be displayed again. It will contain validation errors and the fields filled out from the previous submission.
</small>

### Edit

For retrieving a form for an existing item.

```ruby
def edit
  @product = Product.find(params[:id])
end
```

This loads the product from the database and stores its current state inside the `@product` **instance variable**. Note that the **edit** method does not yet save the changes to `@product`.

### Update

For processing a **patch** request to update an existing item.

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

If the `product` successfully saves with the altered values from the form, the changes will be stored permanently in the database.

### Destroy

For removing an item from the database.

```ruby
def destroy
  @product = Product.find(params[:id])
  @product.destroy!
  flash.notice = 'Product successfully deleted.'
  redirect_to products_url
end
```
