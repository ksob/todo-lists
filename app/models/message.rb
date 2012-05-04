class Message < ActiveRecord::Base
  attr_accessible :content, :status, :todo_list_id
  belongs_to :todo_list
end
