include RandomData

FactoryGirl.define do
  factory :item do
    name RandomData.random_name
  end
end
