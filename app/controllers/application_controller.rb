require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    # stylesheets and imgs dirs
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, 'password_security'
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_loggedin
      if !logged_in?
        flash[:index_message] = "Signup or login to access dreams."
        redirect '/'

      end
    end

  end

end
