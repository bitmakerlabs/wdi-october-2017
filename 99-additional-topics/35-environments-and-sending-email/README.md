# Environments, Emails, and more about using Gems
In this lecture, we'll be looking at how to send email from your Rails apps.  We will also return to the topic of "environments", learn how to protect your passwords and other secret data in the context of a Rails app, we'll talk about how to evaluate a gem before deciding to include it in your project, and when it's appropriate to consider looking for a gem in the first place.  

## Agenda

  1. Configuration management (aka keeping your secrets secret)
  2. Evaluating a gem
  3. Environments
  4. A little bit about how email works
  5. How to send emails through your Rails apps

## Config management (10-15 mins)
- Why a web app might need to know your passwords, API keys, etc.
- Dangers of including this data directly in your code
- Show how to implement [Figaro](https://github.com/laserlemon/figaro) as one easy solution to this issue

## Evaluating a Gem (15 mins)
- When to consider looking for a gem
- Why we should be particular about what gems we include in our projects
- Some metrics that indicate whether a gem looks reliable
- Ok-looking example: Figaro (https://github.com/laserlemon/figaro and https://rubygems.org/gems/figaro)
- Really good-looking example: Carrierwave (https://github.com/carrierwaveuploader/carrierwave and https://rubygems.org/gems/carrierwave) (also why file uploading is something that warrants a gem)
- Poor-looking example: Instagram API (https://rubygems.org/gems/instagram, also https://rubygems.org/gems/instagram_api)

## Environments (5 mins)
- What do we mean when we talk about "environments"
- Development, testing, production
- Staging
- Show config files for each

--- BREAK HERE? ---

## Email theory (10 mins)
[Slides](http://slides.com/natalievictoria/deck)
- You still don't need to know the details of how the email system works
- SMTP vs HTTP
- Email servers as "post offices"
- Periodic vs transactional emails

--- OR BREAK HERE ---

## ActionMailer (30 mins)
http://guides.rubyonrails.org/action_mailer_basics.html

- This is how we send mail through our Rails app
- A specialized controller focused on creating email templates and delivering them
- `rails g mailer UserMailer`
- Look at `UserMailer`, `ApplicationMailer`, views directory and both layouts
- Why `html` and `text`
- Implement `welcome` mail
- Discuss difficulties of styling emails (http://templates.mailchimp.com/resources/email-client-css-support/)
- Show how we can't include links in our emails until we modify our environment config files
- Go through how to configure gmail in `production.rb` (from Rails guide)
- How to be a good Internet citizen when it comes to sending automated emails, touch on anti-spam law

## Summary (5-10 mins)
- We talked about so many different things!
- Configuration management is the most important topic from today
