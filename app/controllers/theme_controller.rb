class ThemeController < ApplicationController

  get '/themes' do
    @themes = Theme.all
    erb :'themes/themes'
  end

  get '/themes/:slug' do
    @theme = Theme.find_by_slug(params[:slug])
    @dream_theme_count = @theme.dreams.count
    erb :'themes/show_theme'
  end

end
