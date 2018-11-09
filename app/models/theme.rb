require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods

  def oxford_comma(array)
    if array.length == 2
      return "#{array[0]} and #{array[1]}"
    elsif 2 < array.length
      array[-1].insert(0, "and ")
    end
    array.join(", ")
  end

  def shared_dreams
    self.dreams.each do |dream|
      dream.themes.reject{|theme| theme == @theme}.each{|theme| theme.name}
    end
  end
end
