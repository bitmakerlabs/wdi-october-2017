# Uploading files and sending email
In this lecture, we'll be looking at how to upload images and files to our web app through the Carrierwave gem and how to send email from your Rails app.

## Agenda

  1. File Uploads w/ Carrierwave
  2. Namespacing (an aside)
  3. Sending mail with ActionMailer


## File Uploads

- Uploading files on the web can be a tricky endeavour
  - Your user needs to choose a file
  - The data needs to be transferred to your server
  - You need to save that data to a file somewhere
    - Often you'll need to process the data at this point
  - You need to store the location of that file somewhere (or at least know how to find it)
  - You need to be able to easily retrieve the file when needed
- Carrierwave and Paperclip are two mature gems for Rails that handle all of this for you
  - Paperclip has been around longer but is more complicated
  - Carrierwave is simple to setup and works great for most use-cases



## Namespacing
- A namespace is a top-level name under which we'll define objects
- Objects defined in the namespace won't conflict with other objects in our system with the same name
- This is a concept that exists in almost every programming language
- It allows us to re-use names without conflicts


#### Namespacing in Ruby
- Namespacing in Ruby is implemented using Modules
- Within a Module you can define methods and objects that are related through the Module name
- The naming scheme for namespacing in Ruby is `ModuleName::ObjectName`

Example: [Faker gem](https://github.com/stympy/faker)
```
Faker::Date.new
Faker::Base.new
Faker::Address.city
```

#### Namespacing in Rails
- Namespacing in Rails is focused on Routes, Controllers and Views
- You can easily define a namespace in Rails by passing a path to your `rails g controller` statement
  - e.g. `rails g controller admin/projects` will create Admin::ProjectsController


## ActionMailer
- This is how we send mail through our Rails app
- A specialized controller focused on creating email templates and delivering them to the receiver
