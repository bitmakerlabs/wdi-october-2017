# Routing and Controllers

Today we'll take our first deep dive into Rails and learn all about Routing and Controllers in Rails.

## Agenda (5 min)

After this lesson, you will know:

- Routing
  - Static Segments
  - Dynamic Segments
  - Path and URL Helpers
  - How To Display Routes
  - Resource Routing
  - Nested Routes

- Controllers
  - CRUD
  - Seven Controller Methods
  - Views
  - Params Hash
  - Index
  - Show
  - New
  - Create
  - Edit
  - Update
  - Destroy
  - Strong Params
  - Filters
  - Application Controller

- Further Resources

- Lessons Exercise: Ipsum's Fairground

## Overview 

When an http request hits a Rails app, the **Router** analyzes the request and decides which **Controller** it will direct it to. 

The **Controller** works with any **Models** necessary, and then renders the appropriate **View**.

# Routing (25 min)

Routes are defined in `config/routes.rb`.

The router looks at **http request method** and **path** of the request, and then using pattern matching, calls the appropriate **controller** and **action** (aka. ruby method).

## Example

A visitor looking for details on a particular product goes to http://store.com/products/55 with their web browser.

We have the following route defined:

```ruby
# config/routes.rb

Rails.application.routes.draw do

  get '/products/:id', to: 'products#show'

end
```

This routes matches the request like so:

`get` - matches the http request method.
`/products/` - matches **/products/** in http://store.com/products/55
`:id` - as it starts with a colon `:`, it's a wildcard match, and therefore matches **55** in http://store.com/products/55

It then sends that request to:

`products` - the **Products**Controller
`show` - the **show** action (ruby method) in the ProductsController

Inside of the Products Controller:

```ruby
# app/controllers/products_controller.rb

class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

end
```

The controller finds the product and renders and returns the view.

## Static Segments

Anything static (not prefixed with a **colon**) must be matched exactly for a route to take effect.

In the following example:

```ruby
get '/stores/:store_id/products/:id', to: 'products#show'
```

`stores` and `products` are static segments.

## Dynamic Segments

Anything dynamic (prefixed with a **colon**) can match on *anything*:

In the following example:

```ruby
get '/stores/:store_id/products/:id', to: 'products#show'
```

`:store_id` and `:id` are dynamic segments, and the following would be legitimate matches:

```bash
http://localhost:3000/stores/99/products/333
http://localhost:3000/stores/silver_snail/products/spiderman_comic
```

## Path and URL Helpers

Along with deciding how it will dispatch an http request, it can create Path and URL helpers that can be used in Controllers and Views.

For example, if we add `as: 'product'` to the end of our route like so:

```ruby
# config/routes.rb
get '/products/:id', to: 'products#show', as: 'product'
```

We will be able to use the following methods to generate a links to the product:

`product_path(55)` generates `/products/55` 

`product_url(55)` generates `http://localhost:3000/products/55`


## Displaying Routes

To see what routes currently exist in your application, use the following from the command line:

```bash
rails routes
```

For our products example, we would see the following:

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

get    '/products',          to: 'products#index', as: 'products#index'
post   '/products',          to: 'products#create'
get    '/products/new',      to: 'products#new',   as: 'products#new
get    '/products/:id',      to: 'products#show',  as: 'products#show'
get    '/products/:id/edit', to: 'products#edit',  as: 'products#edit'
patch  '/products/:id',      to: 'products#update'
put    '/products/:id',      to: 'products#update'
delete '/products/:id',      to: 'products#destroy'
```

#### Note: Put vs Patch

Both **Put** and **Patch** are for **updating** a record. Technically, Put replaces the record completely, where as Patch updates only a part of a record, though in practice when developing a Rails App, you never need to distinguish between the two.


## Nested Routes

Resources can be nested.  For example:

```ruby
# config/routes.rb

resources :stores do
  resources :products
end
```

Would produce the following routes:

```bash
            Prefix  Verb    URI Pattern                          Controller#Action
    store_products  GET     /stores/:store_id/products           products#index
                    POST    /stores/:store_id/products           products#create
 new_store_product  GET     /stores/:store_id/products/new       products#new
edit_store_product  GET     /stores/:store_id/products/:id/edit  products#edit
     store_product  GET     /stores/:store_id/products/:id       products#show
                    PATCH   /stores/:store_id/products/:id       products#update
                    PUT     /stores/:store_id/products/:id       products#update
                    DELETE  /stores/:store_id/products/:id       products#destroy
            stores  GET     /stores                              stores#index
                    POST    /stores                              stores#create
         new_store  GET     /stores/new                          stores#new
        edit_store  GET     /stores/:id/edit                     stores#edit
             store  GET     /stores/:id                          stores#show
                    PATCH   /stores/:id                          stores#update
                    PUT     /stores/:id                          stores#update
                    DELETE  /stores/:id                          stores#destroy
```

Note that nested routes still only route to a single controller, but make more parameters available in the Params Hash (`params[:store_id]` and `params[:id]` in this example).

#### Tip

When you're first starting out as a Rails developer, try to find solutions that avoid nested routes, as often beginners unnecessarily overcomplicate apps with nested routes.


# Controllers (35 min)

## CRUD

When we think about data and how we manipulate it, we use the acronym CRUD to describe what we can do with this data:

- **C**reate a record
- **R**ead a record
- **U**pdate a record
- **D**elete a record

You'll hear developers say things like "Oh ya, it's just a basic **CRUD** app." (and one day, you'll say it too).

## Seven Controller Methods

A standard controller will have the following methods:

- `index` - **get** request that lists a collection
- `show` - **get** request that shows a single record
- `new` - **get** request to pull up a form for a new record
- `create` - **post** request that handles the submission of a form
- `edit` - **get** request to pull up a form for an existing record
- `update` - **put / patch** request handles the submission of a form
- `destroy` - **delete** request to remove a single record

## Views

For `get` requests, the **controller** will implicitly try to render (process and send back as html) a template in a folder named after the controller, and a file named after the method.

For example, a `ProductsController` will try to render the following:


```ruby
class ProductsController < ApplicationController

  def show
   
   # renders /app/views/products/show.html.erb
  end
  
  def index

   # renders /app/views/products/index.html.erb  
  end
  
  def new

   # renders /app/views/products/new.html.erb  
  end    
  
  def edit

   # renders /app/views/products/edit.html.erb  
  end  
  
end
```

We can override the default template to be rendered by specifying what template we'd like rendered. For example:

```ruby 
  def show
    render 'my_special_template'
  end
```

will attempt to render `/app/views/products/my_special_template.html.erb`

## Params Hash

Information about the http request will be accessible via the **Params Hash**.

It will contain:

- the current controller and action (method)
- form data from a `post` or `put` request
- dynamic segment route matches in url. For example: 

```ruby
get '/stores/:store_id/products/:id', to: 'products#show'
``` 

would match the route: 

`http://localhost:3000/stores/99/products/333` 

and would make `{ store_id: 99, id: 333 }` accessible via the params hash:

```ruby
params[:store_id]  # equals 99
params[:id]  # equals 333
```

## Index

For retrieving a collection of items.

```ruby
def index
  @products = Product.all
end
```

Notice how @products is pluralized as it's a collection.

## Show

For retrieving a single item.

```ruby
def show
  @product = Product.find(params[:id])
end
```

Notice how @products is pluralized as it's a single item.

## New

For retrieving a form for a new item:

```ruby
def new
  @product = Product.new
end
```

## Create

For processing a post request to create a new item:

```ruby
def create
  @product = Product.new
  @product.name = params[:name]
  @product.price = params[:price]
  if @product.save
    flash.notice = 'Product successfully created!'
    redirect_to products_url
  else
    flash.alert = 'Product could not be created. Please correct and try again.'
    render 'new'
  end  
end
```



## Edit

For retrieving a form for a new item:

```ruby
def edit
  @product = Product.find(params[:id])
end
```

## Update

For processing a put request to update an existing item:

```ruby
def edit
  @product = Product.find(params[:id])
  @product.name = params[:name]
  @product.price = params[:price]
  if @product.save
    flash.notice = 'Product successfully updated!'
    redirect_to product_url(@product)
  else
    flash.alert = 'Product could not be updated. Please correct and try again.'
    render 'edit'
  end
end
```

## Destroy

```ruby
def destroy
  @product = Product.find(params[:id])
  @product.destroy!
  flash.notice = 'Product successfully deleted.'
  redirect_to products_url  
end
```


## Strongs Params

Usually we specify what params we'll allow through using **Strong Params** instead of specifying each parameters. 

So instead of:

```ruby
  def create
    @product = Product.new
    @product.name = params[:name]
    @product.description = params[:description]    
    @product.price = params[:price]        

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end
```

We would construct our Strong Params method like so:

```ruby
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
```  

## Filters

If we need something to run before every method, we can use the `before_action` filter.  For example, this ensures the user is logged in before accessing this controller:

```ruby
class ProductsController < ApplicationController
  
  before_action :require_login
  
  # rest of controller
  ...
end
```

## Application Controller

Notice how our controller inherits from ApplicationController:  

```ruby
class ProductsController < ApplicationController
```

We can put methods we want accessible to multiple controllers in the ApplicationController as they'll all inherit from them.

For example, the following would provide a useful current_user method throughout our controllers:

```ruby
class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
```

## Further Resources: Rails Guides

#### Rails Routing from the Outside In:
http://guides.rubyonrails.org/routing.html

#### Action Controller Overview:
http://guides.rubyonrails.org/action_controller_overview.html

# Lesson Exercise: Ipsum's Fairground (remaining time)
