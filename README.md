Notes on Travelling

A Rails app that creates users, destinations, and notes, edits and deletes comments, and tracks the most commented on destination.

Prerequisites

The setups steps expect following tools installed on the system.

Github Ruby 2.6.1 Rails 6.0.1

Check your Ruby version ruby -v The ouput should start with something like ruby 2.6.1

If not, install the right ruby version using rbenv

rbenv install 2.6.1

Check your Rails version rails -v The ouput should start with something like Rails 6.0.1

Check your Yarn version yarn -v The ouput should start with something like 1.19.2

If not, install right yarn version pwd /home/david curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

Install webpacker rails webpacker:install

Installation

Check out the repository git clone git@github.com:dunow33/NotesOnTravelling.git

Change dir to notes-on-travelling

cd notes-on-travelling

Install the gems required by the applications bundle install

Start the Rails server You can start the rails server using the command given below.

rails s

Visit the site with the URL http://localhost:3000

License

The gem is available as open source under the terms of the MIT License.