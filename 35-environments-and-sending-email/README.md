# Environments, Emails, and more about using Gems
In this lecture, we'll be looking at how to send email from your Rails apps.  We will also return to the topic of "environments", talk about how to evaluate a gem before deciding to include it in your project, and when it's appropriate to consider looking for a gem in the first place.  Finally, we will spend some time talking about what's involved in the process of uploading files to web apps.

## Agenda

  1. Configuration management (aka keeping your secrets secret)
  2. Evaluating a gem
  3. Environments
  4. A little bit about how email works
  5. How to send emails through your Rails apps
  6. What's involved in uploading files

## ActionMailer
- This is how we send mail through our Rails app
- A specialized controller focused on creating email templates and delivering them

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
