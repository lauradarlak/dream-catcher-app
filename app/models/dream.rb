require_relative 'concerns/slugger.rb'

class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :dream_themes
  has_many :themes, through: :dream_themes

  validates :name, uniqueness: { case_sensitive: false }

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods
end
