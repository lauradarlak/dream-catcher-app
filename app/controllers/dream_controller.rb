class DreamController < ApplicationController

  # index action
  get '/dreams' do
    if logged_in?
      @dreams = Dream.all
      erb :'dreams/dreams'
    else redirect '/'
    end
  end

  # new action
  get '/dreams/new' do
    if logged_in?
      @dreams = Dream.all
      erb :'dreams/create_dream'
    else redirect '/'
    end
  end

  post '/dreams/' do

  end


end
