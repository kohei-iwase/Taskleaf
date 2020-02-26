class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
  	execute 'DELETE FROM tasks;'
  	add_column :tasks, :user_id, :integer
  	change_column :tasks, :user_id, :integer, :null => false
  end


  def down
  	remove_column :tasks, :user_id
  end
end
