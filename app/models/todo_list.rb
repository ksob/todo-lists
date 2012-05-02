class TodoList < ActiveRecord::Base
  has_many :messages
end
