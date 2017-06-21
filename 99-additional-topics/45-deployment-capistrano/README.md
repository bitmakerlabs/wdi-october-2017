# Deployment and Capistrano

A remote server automation and deployment tool written in Ruby.

1. A server to deploy to
  a. Install all pre-requisites for your application
    - Choose your version of Linux
    - Setup a baseline Linux install

    - Ruby
    - DB Server
    - Bundler (other baseline gems)
    - ImageMagick, etc. (third-party dependencies)
    - OpenSSL, etc. (protocols)
  b. Setup a deploy user
    - generally called deploy
    - SSH in as this user for deploys
    - Need to lock this user account down
  c. Setup the folder structure for our deployed app

2. Code needs to be available on a remote source-control repo
  - Github, Bitbucket
  - Mercurial, SVN, etc.

3. Capistrano
  - Pre-work before deploy
  - Connecting to all of your servers
  - Running the deploy scripts on all servers
  - Starting/stopping the app
  - Disconnecting from servers


Layers of the server configuration

```
WORLD
----------------------------------
Caching (Varnish, Memcached) (Optional)
----------------------------------
Load Balancer (Only required when you have more than one app instance)
----------------------------------
Web Server (nginx, Apache, Tomcat, etc.)
----------------------------------
App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)

App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)

App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)
App Server (Passenger, Unicorn, Puma, WEBrick)
-----------------------------------
DB Server / Redis Server (+ other services)
-----------------------------------
```

## Capistrano Folder Structure
- Once you have your deploy.rb setup, you'll want to run `cap deploy:setup`
- That will setup the proper folder structure on the server for Cap

If we use this as the root folder for our app deployment:
`/home/deploy/www/crowdfunder`

`cap deploy:setup` will create the following directories (on the server(s))

* `/home/deploy/www/crowdfunder/releases`
  * This is where the code gets checked out
  * Folder names will be the Git Commit Hash
  * At the end of the deploy, Cap will symlink the deploy folder to /current

* `/home/deploy/www/crowfunder/current`
  * What `/current` points to changes with every deploy

* `/home/deploy/www/crowdfunder/shared`
  * This is where logs and static files go
