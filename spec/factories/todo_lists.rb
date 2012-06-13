# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo_list do
    name 'Test List'
    description 'My Test List'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end