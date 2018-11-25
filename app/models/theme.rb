require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods


  def self.oxford_comma(array)
    if array.length == 1
      return "#{array[0]}"
    elsif array.length == 2
      return array.join(" and ")
    elsif array.length >= 3
      array[-1] = "and #{array[-1]}"
      return array.join(", ")
    end
  end

end
