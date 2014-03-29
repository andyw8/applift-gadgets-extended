# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gadget do
    name 'iPhone'
    association :owner, factory: :user
  end
end
