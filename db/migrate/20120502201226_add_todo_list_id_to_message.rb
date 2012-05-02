class AddTodoListIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :todo_list_id, :integer
  end
end
