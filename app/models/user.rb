require_relative 'concerns/slugger.rb'

class User < ActiveRecord::Base
  has_many :dreams
  has_many :themes, through: :dreams

  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }

  extend Slugger::ClassMethods
  include Slugger::InstanceMethods
end
