include RandomData

FactoryGirl.define do
  factory :list do
    name RandomData.random_name
    description RandomData.random_sentence
    user_id RandomData.random_number
  end
end

# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  description :text
#  user_id     :integer
#  permissions :string           default("open")
#
