require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods

  # def self.collab(current_user)
  #   @all_themes = []
  #
  #   current_user.dreams.map do |dream|
  #     if dream.themes.include?(Theme.find_by_slug(params[:slug]))
  #       dream.themes.map do |theme|
  #           @all_themes << theme.name
  #       end
  #     end
  #   end
  #   corrected_themes = @all_themes.uniq.reject{|theme| theme == @theme.name }
  #   binding.pry
  #
  #   oxford_comma(corrected_themes)
  # end
  #
  # def oxford_comma(array)
  #   if array.length == 1
  #     return "#{array[0]}"
  #   elsif array.length == 2
  #     return array.join(" and ")
  #   elsif array.length >= 3
  #     array[-1] = "and #{array[-1]}"
  #     return array.join(", ")
  #   end
  # end

  def self.theme_find(theme)
    theme_name = theme.name
  
      if Scraper.theme_content(theme_name) != nil
        theme.description = Scraper.theme_content(theme_name)
        theme.save
      else
        "Can't Find!"
      end
  end

end
