##Pintagram	

[![Code Climate](https://codeclimate.com/github/painted/pinstagram2/badges/gpa.svg)](https://codeclimate.com/github/painted/pinstagram2)

This was create during week 9 and 10 at the [Makers Academy] Intensive 12 Week Course.  This is similar to the well known social media site [Instagram].  You can find a working version here on [Heroku].

![Pinstagram Image](https://paintedchef.com/images/Pinstagram2.png)

==========================
##This project is being developed in various versions:

###Version 1 (Live):

	Basic rails setup.

###Version 2 (Live):

	Basic form creation to create posts.

###Version 3 (Live): 

	Login for users via Devise.

###Version 4 (Live):

	Created user accountability.

###Version 5 (Live):

	Implementation of some basic SASS.

###Version 6 (Live):

	Implementation of paperclip to add photos to posts.

###Version 7 (Live):

	Implementation of Amazon S3 for cheaper storage of photos.

###Version 8 (Live):

	Addition of Bootstrap to improve look and feel.

###Version 9 (Live):

	Uploading to Heroku plus debugging to make it happen.

###Version 10 (Live):

	Used many to many relationships to create tags.

###Version 11 (Live):

	Added Gmaps.

###Version 12 (Live):

	Added Stripe for payments.

###Version 13 (To Do):

	Add Omniauth for login via Facebook.

###Version 14 (To Do):

	Add Email verification and lost password capability for users.

###Version 15 (To Do):

	Add Websockets for likes.



Gems Used
----------
	
* [Devise]
* [Bootstrap]
* [Amazon Web Services S3]
* [Paperclip]
* [Gmaps]
* [Rails 12 Factor]
* [Heroku Secrets]
* [Stripe]
* [JBuilder]
* [Omniauth Facebook] for version 13
* [Websocket Rails] for version 15


Technologies Used
---------
* Ruby
* Rails
* JQuery
* Capybara
* Poltergeist
* RSPEC
* Javascript
* Websockets
* JSON API

How to run the tests
--------------------

  * From command line enter:
```
git clone https://github.com/painted/pinstagram2
cd pinstagram2
bin/rake db:create
bin/rake db:migrate
bin/rake db:migrate RAILS_ENV=test
rspec
```


Please feel free to check out the current version in construction here: [Heroku]

[JBuilder]:https://github.com/rails/jbuilder
[Omniauth Facebook]:https://github.com/mkdynamic/omniauth-facebook
[Stripe]:https://github.com/stripe/stripe-ruby
[Websocket Rails]:https://github.com/websocket-rails/websocket-rails
[Makers Academy]:http://www.makersacademy.com
[Heroku]:http://pinstagram2.herokuapp.com/posts
[Painted Ltd]:https://painted.herokuapp.com/
[Devise]:https://github.com/plataformatec/devise
[Bootstrap]:https://github.com/twbs/bootstrap-sass
[Amazon Web Services S3]:http://aws.amazon.com/sdk-for-ruby/
[Paperclip]:https://github.com/thoughtbot/paperclip
[Gmaps]:http://hpneo.github.io/gmaps/
[Rails 12 Factor]:https://github.com/heroku/rails_12factor
[Heroku Secrets]:https://github.com/alexpeattie/heroku_secrets
[Instagram]:http://instagram.com/