class AddMissingTimestampsTools < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :tools, null: true
    
    time = Time.zone.parse( '2018-01-01 00:00:00')
    update "UPDATE tools SET created_at = '#{time}'"
    update "UPDATE tools SET updated_at = '#{time}'"
    
    change_column_null :tools, :created_at, false
    change_column_null :tools, :updated_at, false
  end
end
