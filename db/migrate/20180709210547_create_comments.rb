class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :photographer_id
      t.integer :theme_id
    end
  end
end
