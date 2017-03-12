class UsersController < ApplicationController
  
  get '/signup' do
    if session.key?(:id) then redirect "/images" end
    erb :"/users/create_user"
  end
  
  get '/logout' do
    session.clear
    redirect "/"
  end

  
  post '/signup' do
    @user=User.create(params)
    if !@user.valid? then redirect "/signup" end
    session[:id] = @user.id
    redirect "/images"
  end

  get '/login' do
    if session[:id] then redirect "/images" end
    erb :"/users/login"
  end

  post '/login' do
    user= User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id]=user.id
      redirect "/images"
    else
      redirect "/login"
    end
  end

end
