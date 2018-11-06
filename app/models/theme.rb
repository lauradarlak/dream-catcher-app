require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods

  def theme_find(theme_arr)
    theme_arr.each do |theme|
      theme_name = theme.name
      binding.pry
      Scraper.theme_content(theme_name)
    end
  end

end
