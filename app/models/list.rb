class List < ActiveRecord::Base
  belongs_to :user

  def active_model_serializer
    ListSerializer
  end
end
