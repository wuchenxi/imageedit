class ImagesController < ApplicationController
  
  get '/' do
    erb :index
  end
  
  get '/images' do
    @session=session
    erb :'images/index'
  end

end

