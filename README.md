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

x=0.5;y=0.5; for(i=0;i<4000000;i+=1){ if(Math.random()>0.6){ny=0.4*y+0.05;nx=0.3+0.4*x;} else if(Math.random()<0.05){nx=0.495+0.01*x;ny=0.1*y+0.4;} else if(Math.random()<0.05){nx=0.495+0.01*x;ny=0.1*y;} else {nx=0.5+0.5*(x-0.5)-0.866*(y-0.5); ny=0.5+0.5*(y-0.5)+0.866*(x-0.5);} x=nx;y=ny; plot(x*600,y*600);} 

defines a fractal from iterative function system.

/images Show all images (title, source code and author)
/users/id Show the profile page of a user

A logged-in user may update their own image from the image page.

# Contributor's Guide

/db: Definition of the database
/app/controllers/application_controller.rb: Configuration and helpers
/app/controllers/images_controller.rb: Image creation, editing, listing, display.
/app/controllers/user_controller.rb: User account creation and login

# license: BSD (https://opensource.org/licenses/BSD-2_Clause)
