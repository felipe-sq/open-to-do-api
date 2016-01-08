class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :created_at, :username

  has_many :lists

  def created_at
    object.created_at.strftime('%B %d, %Y')
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
