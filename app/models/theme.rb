require_relative 'concerns/slugger.rb'

class Theme < ActiveRecord::Base
  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods
end
