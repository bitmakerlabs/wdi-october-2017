# Scheduled and Background Tasks & Jobs

## Agenda
+ Scheduled Tasks vs Background Jobs
+ cron
+ rake tasks
+ `whenever` gem
+ Heroku Scheduler
+ Background Job Queues
+ ActiveJob

## Scheduled Tasks vs Background Jobs
+ **Scheduled Task:** A job that is run at a specific time, usually periodically. For example, generating a weekly report on user behaviour.
+ **Background Job:** A job that is usually started due to some user action, but runs in the background. The request/response cycle does not wait for the job to complete before proceeding. For example, sending a confirmation email.

## cron
A scheduler built into Unix-based operating systems. It is used to schedule jobs to run at fixed times or intervals. It is generally what we as web programmers will use to schedule jobs.

Cron jobs can be scheduled with the cron table, more commonly referred to as crontab. A typical cron job definition in the crontab looks like this:
```
1 0 * * * echo 'Hello, World!'
```

The numbers and asterixes preceding the command indicate the interval at which the job should be run:
```
 ┌───────────── minute (0 - 59)
 │ ┌───────────── hour (0 - 23)
 │ │ ┌───────────── day of month (1 - 31)
 │ │ │ ┌───────────── month (1 - 12)
 │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
 │ │ │ │ │                                       7 is also Sunday)
 │ │ │ │ │
 │ │ │ │ │
 * * * * *  command to execute
```

Therefore, in our previous example, `Hello, World!` would be echoed every day at 12:01 am.

Currently defined cron jobs can be listed with `crontab -l`, and the crontab can be edited with `crontab -e`.

**NOTE** that editing the crontab requires a terminal based editor be set as your `EDITOR`; you can't edit the crontab with Atom. You can specify an editor other than your default editor with something like:
```
EDITOR=nano crontab -e
```

## rake tasks
We can do more than just run system commands with cron; we can also run rake tasks. This way we can do something a little more useful.

Rails project have a number of built in rake tasks, but we can also define our own. A custom rake task lives in the `lib/tasks` directory, and looks something like this:
```rb
desc "I am short, but comprehensive description for my cool task"
task task_name: [:prerequisite_task, :another_task_we_depend_on] do
  # All your magic here
  # Any valid Ruby code is allowed
end
```

Note that in order for the rails environment to be loaded in the task, `:environment` must be included as a prerequisite task.

## `whenever` gem
[Whenever](https://github.com/javan/whenever) is a gem that makes it a little easier for us to use rake tasks inside of cron jobs. The README has some great examples.

## Heroku Scheduler
Unfortunately, Heroku does not allow us to interact with cron directly. Instead, we have to use the [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler) to define our scheduled jobs.

## Background Job Queues
In order to run background jobs, we need a place that we can put background jobs before they are processed. This is called a job queue, and there are many existing solutions. In order of complexity, here are a few:

+ **Delayed Job:** Simply stores job on your existing DB, be that SQL or MongoDB.
+ **Resque:** Opts to use Redis to store its job queue instead, for the added performance.
+ **Sidekiq:** Also uses Redis, as well as multithreading, so many jobs can be executed simultaneously by a single process.

In this lecture, we'll focus on Delayed Job for simplicity.

## ActiveJob
[ActiveJob](http://edgeguides.rubyonrails.org/active_job_basics.html) provides us with a common interface for all of these solutions, somewhat like how ActiveRecord gives us a common way to interact with many different SQL stores.

In our `config/application.rb` file, we need to tell active job what our ``queue_adapter`` is:
```rb

# config/application.rb
module YourApp
  class Application < Rails::Application
    # Be sure to have the adapter's gem in your Gemfile
    # and follow the adapter's specific installation
    # and deployment instructions.
    config.active_job.queue_adapter = :delayed_job
  end
end
```

Next, we'll need to define our jobs:
```rb
class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*guests)
    # Do something later
  end
end
```

And finally, we'll need to queue them:
```rb
GuestsCleanupJob.perform_later guest
```

