class Dream < ActiveRecord::Base

  belongs_to :user
  has_many :dream_themes
  has_many :themes, through: :dream_themes

end
