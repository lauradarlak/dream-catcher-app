class DreamController < ApplicationController
  get '/dreams' do
    if logged_in?
      @dreams = Dreams.all
      erb :'dreams/dreams'
    else redirect '/'
    end
  end

  get '/dreams/new' do
    if logged_in?
      erb :'dreams/create_dream'
    else redirect '/'
    end
  end


end
