require './config/environment'

use Rack::MethodOverride
use ImagesController
use UsersController
run ApplicationController
