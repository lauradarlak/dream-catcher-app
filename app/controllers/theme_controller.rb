require_relative '../models/theme.rb'

class ThemeController < ApplicationController

  get '/themes' do
    @themes = Theme.all
    erb :'themes/themes'
  end

  get '/themes/:slug' do
    @theme = Theme.find_by_slug(params[:slug])
    erb :'themes/show_theme'
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
    end
  end
end
