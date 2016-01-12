class AddCompleteOptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :complete, :boolean, default: false
  end
end
