FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    uid { email }
    provider { 'email' }
    password { Faker::Internet.password }
  end
end
