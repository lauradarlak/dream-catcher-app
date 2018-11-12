class DreamController < ApplicationController

  # index action
  get '/dreams' do
    if logged_in?
      @dreams = current_user.dreams
      erb :'dreams/dreams'
    else
      flash[:index_message] = "Signup or login to access dreams."
      redirect '/'
    end
  end

  # new action
  get '/dreams/new' do
    if logged_in?
      @dreams = Dream.all
      erb :'dreams/create_dream'
    else
      flash[:index_message] = "Signup or login to create a new dream."
      redirect '/'
    end
  end

  post '/dreams' do
    if logged_in?
      if Dream.new(params[:dream]).valid?
        @dream = current_user.dreams.build(params[:dream])
        @dream.save
        if !params[:theme][:name].empty?
          @dream.themes << Theme.create(name: params[:theme][:name])
        end
        redirect "/dreams/#{@dream.slug}"
      else
        flash[:new_dream] = "Sorry, but that dream name is already taken, please select another name."
        redirect '/dreams/new'
      end
    end
  end

  # show action
  get '/dreams/:slug' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        erb :'dreams/show_dream'
      else
        redirect '/dreams'
      end
    else
      flash[:index_message] = "Sign up or login to access dreams."
      redirect '/'
    end
  end

  # edit action
  get '/dreams/:slug/edit' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        erb :'dreams/edit_dreams'
      else
        flash[:dream_index] = "You cannot edit a dream that does not belong to you."
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
        if !params[:theme][:name].empty?
          @dream.themes << Theme.create(name: params[:theme][:name])
        end
        redirect "/dreams/#{@dream.slug}"
      else
        flash[:dream_index] = "You cannot edit a dream that does not belong to you."
        redirect '/dreams'
      end
    else
      redirect '/'
    end
  end

  # delete action

  delete '/dreams/:slug/delete' do
    if logged_in?
      @dream = Dream.find_by_slug(params[:slug])
      if @dream && @dream.user == current_user
        @dream.delete
        redirect to '/dreams'
      end
      redirect to '/dreams'
    else
      redirect to '/'
    end
  end

end
