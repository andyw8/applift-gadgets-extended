# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'hello123'
  end
end
