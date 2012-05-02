class TodoList < ActiveRecord::Base
  has_many :messages
  
  def messages(options={})
    Message.all({:conditions => {:todo_list_id => self.id}}.merge(options))
  end
end
