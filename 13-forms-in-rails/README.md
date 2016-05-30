# Forms in Rails

Today we'll learn the various ways to create a form in Rails.

## Agenda
0. READ THE DOCS
1. Forms recap
2. Request / Response Cycle recap
3. Using form helpers on your templates to make your form
4. Gathering data from your form in your controller
5. Strong parameters


## READ THE DOCS
- While working in Rails, it's a very good idea to keep the following three tabs open at all times, you will constantly need to refer to them:
  - [Rails Guides](http://guides.rubyonrails.org)
  - [Rails API](http://api.rubyonrails.org)
  - [Ruby Docs](http://ruby-doc.org)


## Forms recap

- We use forms to gather information from users
- How do forms work?
  - What are the important attributes that make a form work?
- What's the purpose of hidden form elements?


## Request / Response lifecycle recap (or How The Web Works™)

- Request comes in through the Router
- The router matches the request on the method and the path
  - When matching the path, it uses a pattern to match the path string, so we can have variable placeholders in paths
  - i.e. `/films/:id` matches with `/films/12` and `/films/monkeys`, where :`id` is a value representing the unique id of one film
  - It's **VERY IMPORTANT** to understand how the router works, what `rake routes` shows you and how to use route helpers
- Once the router finds a match, it routes the request to the corresponding controller and action
  - The controller and action combo is often written as `controller#action` in your routes file
  - If there are variable placeholders in the path, they are added to the params hash so the controller and view have access
- The controller coordinates with the model and the views to get everything it needs to create a response for the user
  - Looks stuff up in the database via models
  - Renders that stuff in a view that the user can make sense of
- Controller provides a response by rendering a view or redirecting the user onward


## Using form helpers

- [`form_tag`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-form_tag)
  - Forms unconnected to models
  - Use the `_tag` variant of form helpers (e.g. `text_field_tag`)
- [`form_for`](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for)
  - Create a form for doing CRUD on an object
  - We generally want to deal with objects rather than values
  - This allows us to rely on Rails to do a lot of the heavy lifting for us
  - Provides a form builder to the form block that knows about the object the form is related to
- Cross-Site Request Forgery (CSRF) Token
  - This is used to ensure malicious users don't fake like they're submitting from our site (possibly as someone else!)


## Gathering data from your form in your controller

- The data provided by the form is provided to your controller and your view in the `params` hash
- The `params` hash will be the combination of all of the path params from the route as well as the params from your form


## Strong parameters

- Forbids doing mass-assignment on a model from the params hash (i.e. `Film.create(params[:film])`)
- Instead, we have to whitelist the parameters that are allowed to be assigned to our model
  - This way malicious users can't add whatever they want to your model
- Full details can be found in the [strong_parameters gem page](https://github.com/rails/strong_parameters)


### Further Reading

- [Rails Form Helpers](http://guides.rubyonrails.org/form_helpers.html)
- [Rails Routing from the Outside In](http://guides.rubyonrails.org/routing.html)
