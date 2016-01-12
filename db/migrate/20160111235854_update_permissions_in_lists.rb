class UpdatePermissionsInLists < ActiveRecord::Migration
  def change
    change_column :lists, :permissions, :string, default: "open"
  end
end
