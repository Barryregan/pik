class AddMissingTimestamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :comments, null: true
    
    time = Time.zone.parse( '2018-01-01 00:00:00')
    update "UPDATE comments SET created_at = '#{time}'"
    update "UPDATE comments SET updated_at = '#{time}'"
    
    change_column_null :comments, :created_at, false
    change_column_null :comments, :updated_at, false
  end
end
