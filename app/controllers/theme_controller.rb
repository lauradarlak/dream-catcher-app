require_relative '../models/theme.rb'

class ThemeController < ApplicationController

  get '/themes' do
    if logged_in?
      @themes = current_user.themes.uniq
      erb :'themes/themes'
    else
      flash[:index_message] = "Signup or login to access dream themes."
      redirect '/'
    end
  end

  get '/themes/:slug' do
    if logged_in?
      @theme = Theme.find_by_slug(params[:slug])
      if current_user.themes.include?(@theme)
        erb :'themes/show_theme'
      else
        flash[:themes_index_message] = "You have never dreamed about this theme. Select a different theme."
        redirect '/themes'
      end
    else
      flash[:index_message] = "Sign up or login to access dream themes."
      redirect '/'
    end
  end

  helpers do
    def collab
      @all_themes = []
      current_user.dreams.map do |dream|
        if dream.themes.include?(@theme)
          dream.themes.map do |theme|
              @all_themes << theme.name
          end
        end
      end
      corrected_themes = @all_themes.uniq.reject{|theme| theme == @theme.name }

      Theme.oxford_comma(corrected_themes)
    end

  end
end
