FactoryGirl.define do
  factory :message do
    #todo_list_id {create(:form_template).id}
    status 0
    content "Task 1"
    association :todo_list
  end
end