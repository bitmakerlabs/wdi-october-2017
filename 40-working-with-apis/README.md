# Working with APIs

In this lesson, we'll investigate why you might need to make API requests from the server and how to use an example API by using a gem.

NOTE: This version of the lesson uses the Twitter Gem. Feel free to make requests manually using HTTParty (or whatever) and build your own API wrapper instead.

Slides: http://slides.com/bitmaker/html-css-workshop-5-23-13-14-16

## Agenda
After this lesson, you'll know:

  * Why you need to make some API requests from the server
  * How to research your API and read its documentation.
  * How to use a gem that handles OAuth for an API (Twitter).

1. Start with slides, take your time - 20 minutes

1. Researching Twitter API - 15-20 minutes
  * Want to make an app that displays tweets about a topic
  * Google 'Twitter API' and go to their API dev docs
  * Regular vs streaming API
  * API rate limiting
  * Try out an API endpoint in the browser - what happens?
  * Need OAuth!
  * Find capabilities - does it do what we want?
    * URL endpoints with explanations
    * example responses
      * Can just google search "Twitter API JSON" to find what we want

1. Researching Twitter Gem - 5 minutes
  * surely someone has written something to use Twitter for Rails?
    * Google it!
  * Twitter Gem - looks goods, lots of forks and followers

1. Registering your application with Twitter - 10 minutes
  * Website
    * Twitter wants to know who you are in the real world - just use a placeholder here for now
  * Callback URL - where to go after asking a user to sign in through the service
  * Auto-generates a consumer public/private key pair
    * like username/password
  * Need to generate an access token public/private pair
    * represents what we have access to
    * can be revoked

1. Break - 5-10 minutes

1. Build our app! - 15 minutes
  * rails new; add route, controller, view
  * start by pasting example client config into controller (found on Gem readme)
  * use `client.search` line found on Gem readme and display results
  * display some other results from the data as well

1. Refactor - 15 minutes
  * why can't we commit yet? We have private info in here!
    * have to move information to secrets.yaml
    * Rails.application.secrets.key_name_here
    * (restart server after modifying secrets)
  * need to refactor code out of controller
    * make a model and move it there

1. Use PostMan to make requests to the Twitter API (time permitting) - 10 minutes

1. Use HTTParty to make our request to Twitter (time permitting)
