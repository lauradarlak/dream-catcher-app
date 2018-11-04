class CreateDreamThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :dream_themes do |t|
      t.integer :dream_id
      t.integer :theme_id
    end
  end
end
