require_relative 'concerns/slugger.rb'

class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_themes
  has_many :themes, through: :dream_themes

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods
end
