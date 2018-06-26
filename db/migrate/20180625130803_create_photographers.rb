class CreatePhotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :photographers do |t|
      t.string :togname
      t.string :email
      t.timestamps
    end
  end
end
