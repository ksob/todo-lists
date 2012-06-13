FactoryGirl.define do
  factory :role do
    sequence(:name) { |n| "Member" }
  end
end