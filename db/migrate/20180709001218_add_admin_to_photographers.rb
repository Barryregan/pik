class AddAdminToPhotographers < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :admin, :boolean, default:false
  end
end
