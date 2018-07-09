class AddMissingTimestampsThemeTools < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :theme_tools, null: true
    
    time = Time.zone.parse( '2018-01-01 00:00:00')
    update "UPDATE theme_tools SET created_at = '#{time}'"
    update "UPDATE theme_tools SET updated_at = '#{time}'"
    
    change_column_null :theme_tools, :created_at, false
    change_column_null :theme_tools, :updated_at, false
  end
end
