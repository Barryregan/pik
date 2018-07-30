class Likes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :photographer_id
      t.integer :theme_id
      t.timestamps
    end
  end
end
