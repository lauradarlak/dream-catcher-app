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

  get '/success' do
    "SUCCESS!"
  end

  post '/dreams' do
    if logged_in?
      @dream = Dream.create(name: params[:name])
      @dream.dream_details = params[:dream_details]
      @dream.user = current_user
      @dream.theme_ids = params[:themes]
      @dream.save
      redirect "/dreams/#{@dream.slug}"
    else redirect '/dreams/new'
    end
  end

  # show action

  get '/dreams/:slug' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      erb :'dreams/show_dream'
    else redirect '/'
    end
  end

  # edit action

  get '/dreams/:slug/edit' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        erb :'dreams/edit_dreams'
      else
        redirect '/dreams'
      end
    else
      redirect '/'
    end
  end

  patch '/dreams/:slug' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        @dream.update(dream_details: params[:dream_details])
        @dream.theme_ids = params[:themes]
        @dream.save
        redirect "/dreams/#{@dream.slug}"
      else
        redirect '/dreams'
      end
    else
      redirect '/'
    end
  end

end
