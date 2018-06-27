class AddPhotographerIdToThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :photographer_id, :integer
  end
end
