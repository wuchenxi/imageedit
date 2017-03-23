require 'rack-flash'

class ImagesController < ApplicationController

  use Rack::Flash
  get '/' do
    erb :index
  end
  
  get '/images' do
    erb :"images/index"
  end

  get '/images/new' do
    if !logged_in? then
      flash[:message] = "Please login to continue."
      redirect "/login"
    end
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
    @user=User.find_by(id: params[:id])
    erb :"images/user_profile"
  end

  get '/images/:id/edit' do
    if !logged_in? then
      flash[:message] = "Please login to continue."
      redirect '/login'
    end
    @image=Image.find_by(id: params[:id])
    if @image.user!=current_user then
      flash[:message] = "Incorrect account."
      redirect '/images'
    end
    erb :"/images/edit_image"
  end

  post '/images/:id' do
    image=current_user.images.find_by(id: params[:id])
    image.update(name: params[:name], src: params[:src])
    if !image.valid? then
      flash[:message] = "Incomplete input."
      redirect "/images/#{params[:id]}/edit"
    end
    image.save
    redirect '/images'
  end

  post '/images/:id/delete' do
    image=current_user.images.find_by(id: params[:id])
    image.destroy
    redirect '/images'
  end
      
  get '/images/:id/draw' do
    @image=Image.find_by(id: params[:id])  
    @own=false
    if logged_in? && @image.user==current_user then @own=true end
    erb :"/images/show_image"
  end
    
end

