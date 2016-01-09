class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  enum permissions: [:open, :locked]

  validates_inclusion_of :permissions, :in => %w( open locked ), message: "%{value} is not a valid permissions. Please use either 'open' or 'locked'."

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
