An App for posting images drawn with javascript

# Installation

bundle install --path vendor/bundle
bundle exec rake db:migrate

Start: 
bundle exec rackup

# Usage

A sample image:

for(var i=0;i<1;i+=0.001){
plot(i*600,i*i*600);
}

defines a parabola.

/images Show all images (title, source code and author)
/users/id Show the profile page of a user

A logged-in user may update their own image from the image page.

# Contributor's Guide

/db: Definition of the database
/app/controllers/application_controller.rb: Configuration and helpers
/app/controllers/images_controller.rb: Image creation, editing, listing, display.
/app/controllers/user_controller.rb: User account creation and login

# license: BSD (https://opensource.org/licenses/BSD-2_Clause)
