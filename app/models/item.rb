class Item < ActiveRecord::Base
  belongs_to :user

  def active_model_serializer
    ItemSerializer
  end
end
