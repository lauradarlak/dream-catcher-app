class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/dreams'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:signup_message] = "Please fill out all required fields: Username, Email, and Password"
      redirect '/signup'
    end
    if !User.new(:username => params[:username], :password => params[:password]).valid?
      flash[:signup_message] ="Username is already taken, please select a different username."
      redirect to 'signup'
    elsif !User.new(:email => params[:email], :password => params[:password]).valid?
      flash[:signup_message] ="That email address is already taken. Please try to login."
      redirect to 'signup'
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
    else
      flash[:login_message] = "Your username and password is incorrect. Please try again."
      redirect '/login'
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
