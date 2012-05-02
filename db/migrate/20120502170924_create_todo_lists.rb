class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :name
      t.text :description
      t.text :contents

      t.timestamps
    end
  end
end
