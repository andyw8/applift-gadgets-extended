# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gadget do
    name 'iPhone'
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'iphone.png')) }
    association :owner, factory: :user
  end
end
