class AddImageToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :image, :string
  end
end
