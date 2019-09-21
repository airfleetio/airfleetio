# Air Fleetio

The application is up and running at https://airfleetio.herokuapp.com.
Every time a commit is merged into master, the code is deployed to Heroku.

# Code highlights

The best way to understand some of the choices made while building
this application is to read through the commit messages, one by one.

In general, this application follows most conventions for a Rails 6 app.
Turbolinks makes navigation faster and Active Job supports background jobs.

Given the sheer amount of JavaScript in this code, the decision was made
to remove both Sprockets and Webpacker and to link assets directly from CDN.
The result is a fast application and a super-speedy deploy (~ 10 seconds!).

# Configuration

This application depends on two third-party APIs: Fleet.io and Pusher.
The credentials to access these APIs are stored secretly with Rails credentials.

In order to decrypt the credentials, contact the author to obtain the master key.
Alternatively, feel free to replace with your own credentials, making sure that
the structure of your credentials file matches this structure:

```
fleetio:
  auth_token: <AUTH TOKEN>
  account_token: <ACCOUNT TOKEN>

pusher:
  app_id: <APP ID>
  key: <KEY>
  secret: <SECRET>
  cluster: mt1
```
