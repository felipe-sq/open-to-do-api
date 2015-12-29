class User < ActiveRecord::Base
  has_many :items

  def active_model_serializer
    UserSerializer
  end
end
