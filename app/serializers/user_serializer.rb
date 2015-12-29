class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :created_at

  has_many :items
  has_many :lists

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
