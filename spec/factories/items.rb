include RandomData

FactoryGirl.define do
  factory :item do
    name RandomData.random_name
  end
end

# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer
#  completed  :boolean          default(FALSE)
#
