class DreamTheme < ActiveRecord::Base
  belongs_to :dream
  belongs_to :theme
end
