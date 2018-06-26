class ChangeColumnInThemes < ActiveRecord::Migration[5.2]
  def change
    rename_column :themes, :email, :description
    change_column :themes, :description, :text
  end
end
