class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :permissions, :user_id

  has_many :items
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
#  permissions :integer          default(0)
#
