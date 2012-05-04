class RemoveContentsFromTodoLists < ActiveRecord::Migration
  def up
    remove_column :todo_lists, :contents
  end

  def down
    add_column :todo_lists, :contents, :text
  end
end
