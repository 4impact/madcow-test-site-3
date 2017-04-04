# Madcow Test Site 3

This is the third iteration of the Madcow Test Site. It is being ported based on the codebase from the grails 2.0 madcow-test-site application. 

The idea is that it will be built up and deployed to heroku for madcow to run against. 

It is intended to be hosted at 
https://madcow-test-site-3.herokuapp.com 

or 

https://madcow-test-site-3.4impact.net.au

All the AJAX features of the old site are being revisited as they were deprecated in Grails v3.0. 

This has been built using the Grails for Heroku Grails 3 Example codebase and uses a Postgres backend DB.

It is visible here: https://github.com/kissaten/grails3-example

## Grails 3 on Heroku Example

```
$ git clone <this repo>
$ heroku create
$ heroku addons:create heroku-postgresql
$ git push heroku master
```

NOTE: You may find that this app fails to start up with in the 60 second
boot timeout limit imposed by Heroku. If that's the case, please contact
[Heroku Support](http://help.heroku.com).
