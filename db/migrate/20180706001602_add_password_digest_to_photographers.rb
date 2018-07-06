class AddPasswordDigestToPhotographers < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :password_digest, :string
  end
end
