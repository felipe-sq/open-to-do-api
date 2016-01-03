class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :created_at

  has_many :items

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string
#
