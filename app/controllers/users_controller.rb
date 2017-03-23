require 'rack-flash'

class UsersController < ApplicationController

  use Rack::Flash

  get '/signup' do
    if logged_in? then
      flash[:message] = "Already logged in."
      redirect "/images"
    end
    erb :"/users/create_user"
  end
  
  get '/logout' do
    session.clear
    redirect "/"
  end

  
  post '/signup' do
    @user=User.create(params)
    if !@user.valid? then
      flash[:message] = "Invalid input."
      redirect "/signup"
    end
    session[:id] = @user.id
    redirect "/images"
  end

  get '/login' do
    if logged_in? then
      flash[:message] = "Already logged in."
      redirect "/images"
    end
    erb :"/users/login"
  end

  post '/login' do
    user= User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id]=user.id
      redirect "/images"
    else
      flash[:message] = "Incorrect username or password."
      redirect "/login"
    end
  end

end
