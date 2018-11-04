class User < ActiveRecord::Base
  has_many :dreams
  has_many :themes, through: :dreams

  has_secure_password
end
