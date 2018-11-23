require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods

  def self.theme_find(theme)
    theme_name = theme.name

      if Scraper.theme_content(theme_name) != nil
        theme.description = Scraper.theme_content(theme_name)
        theme.save
      else
        "Unable to find an interpretation for this dream theme."
      end
  end

end
