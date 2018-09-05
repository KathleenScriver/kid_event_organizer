class AddTimestampsToUsers < ActiveRecord::Migration[5.1]
  def change_table
    add_timstamps :users
  end
end
