class ApplicationController < Sinatra::Base

  configure do
    # stylesheets and imgs dirs
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, 'password_security'
  end

  get '/' do
    erb :welcome
  end

end
