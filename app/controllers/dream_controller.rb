class DreamController < ApplicationController

  # index action
  get '/dreams' do
    if logged_in?
      @dreams = current_user.dreams
      erb :'dreams/dreams'
    else
      redirect '/'
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

  post '/dreams' do
    if logged_in?
      @dream = current_user.dreams.build(params[:dream])
      # @dream.dream_details = params[:dream_details]
      # @dream.user_id = current_user.id
      @dream.theme_ids = params[:theme_ids]
      @dream.save
      theme_arr = @dream.themes
      Theme.theme_find(theme_arr)
      binding.pry
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
        @dream.update(params["dream"])
        redirect "/dreams/#{@dream.slug}"
      else
        redirect '/dreams'
      end
    else
      redirect '/'
    end
  end

  delete '/dreams/:slug/delete' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        @dream.delete
      end
      redirect to '/dreams'
    else
      redirect to '/'
    end
  end

end
