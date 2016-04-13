# Validations, Nested Resources & Partials

The valuable part of most apps is the data they gather and work with. There's an old saying about data: garbage in, garbage out. Validations help us ensure that the data that's written into our database conforms to the business rules we define in our application.

We'll also look at nested resources, the concept of a model that only exists in context of another (e.g. a review can only exist for a specific product). We'll make a form for a nested model and look at how to refactor the form using partials to maximize template reuse.

## Agenda
After this lesson, you will know:

  * Validations
  * Nested resources
  * Filters
  * Partials
  * Callbacks

## Validations

Methods that trigger them:

  * create
  * create!
  * save
  * save!
  * update
  * update_attributes
  * update_attributes!

.valid?
