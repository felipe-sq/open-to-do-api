include RandomData

FactoryGirl.define do
  pw = RandomData.random_sentence
  name = RandomData.random_name
  factory :user do
    name name
    sequence(:email) { |n| "user_#{n}@factory.com" }
    password pw
    username name
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#
