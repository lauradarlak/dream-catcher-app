class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :name
      t.date :dream_date
      t.integer :user_id
    end
  end
end
