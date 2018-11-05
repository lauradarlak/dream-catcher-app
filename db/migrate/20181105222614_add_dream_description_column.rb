class AddDreamDescriptionColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :dreams, :dream_details, :text
  end
end
