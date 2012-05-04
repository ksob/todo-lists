class AddStatusToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :status, :boolean
  end
end
