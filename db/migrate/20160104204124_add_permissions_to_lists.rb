class AddPermissionsToLists < ActiveRecord::Migration
  def change
    add_column :lists, :public, :boolean
    add_index :lists, :public
  end
end
