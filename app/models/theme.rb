class Theme < ActiveRecord::Base

  has_many :dream_themes
  has_many :dreams, through: :dream_themes
  has_many :users, through: :dreams

end
