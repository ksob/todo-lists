todo-lists
==========

A basic Rails 3.1 application for TODO list management. 

Compatibility
=============

Developed and tested using the following setup:

	$ ruby -v
	ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10.7.0]
	$ rails -v
	Rails 3.1.4
	
Installation
============

	git clone git://github.com/ksob/todo-lists.git
	cd ./todo-lists
	bundle install
  
Faye Server Setup
=================

This application requires Faye Server to run.
By default it uses existing one on Heroku. 
To set your own remote Faye Server just clone this app and upload it onto Heroku adding Procfile containing:

    web: bundle exec rackup private_pub.ru -p $PORT -s thin -E production

To run Faye Server locally just clone this app and execute:

	bundle install --without test
	rackup private_pub.ru -s thin -E production
  
You can change URL inside: config/private_pub.yml
		
Running
=======

    bundle install --without test
    rake db:migrate
    rake db:seed
    rails s
	
Test Suite
==========

    bundle install
    RAILS_ENV=test rake db:migrate
    RAILS_ENV=test rake db:seed
    rake spec
  
License
=======

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.