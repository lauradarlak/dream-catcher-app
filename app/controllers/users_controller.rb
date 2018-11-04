class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else redirect '/dreams'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/dreams'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else redirect '/dreams'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    # if user != nil
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/dreams'
    else redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else redirect '/'
    end
  end

end
