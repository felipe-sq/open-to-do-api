include RandomData

FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    name RandomData.random_name
    sequence(:email){|n| "user_#{n}@factory.com" }
    password_digest pw
  end
end
