require 'rack-flash'

class ImagesController < ApplicationController

  use Rack::Flash
  get '/' do
    erb :index
  end
  
  get '/images' do
    @session=session
    erb :"images/index"
  end

  get '/images/new' do
    if !logged_in? then
      flash[:message] = "Please login to continue."
      redirect "/login"
    end
    @user=current_user
    erb :"images/new"
  end

  post '/images' do
    if !logged_in? then
      flash[:message] = "Please login to continue."
      redirect "/login"
    end
    @image=current_user.images.create(params)
    if !@image.errors.messages.empty? then redirect '/images/new' end
    redirect '/images'
  end

  get '/users/:id' do
    @session=session
    @user=User.find(params[:id].to_i)
    @own=false
    if logged_in? && @user==current_user then @own=true end
    erb :"images/user_profile"
  end

  get '/images/:id/edit' do
    if !logged_in? then redirect '/login' end
    @image=Image.find(params[:id].to_i)
    if @image.user!=current_user then
      flash[:message] = "Incorrect account."
      redirect '/images'
    end
    erb :"/images/edit_image"
  end

  post '/images/:id' do
    image=current_user.images.find_by(id: params[:id].to_i)
    image.update(params)
    if !image.valid? then
      flash[:message] = "Incomplete input."
      redirect "/images/#{params[:id]}/edit"
    end
    image.save
    redirect '/images'
  end

  post '/images/:id/delete' do
    image=current_user.images.find_by(id: params[:id].to_i)
    if image.user==current_user then
      image.destroy
    else
      flash[:message] = "Incorrect account."
    end
    redirect '/images'
  end
      
  get '/images/:id/draw' do
    @image=Image.find(params[:id].to_i)
    erb :"/images/show_image"
  end
    
end

