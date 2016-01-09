class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  enum permissions: [:open, :private, :viewable]
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
