class CreateThemeTools < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_tools do |t|
      t.integer :theme_id
      t.integer :tool_id
    end
  end
end
