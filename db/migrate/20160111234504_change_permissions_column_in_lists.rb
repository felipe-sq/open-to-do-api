class ChangePermissionsColumnInLists < ActiveRecord::Migration
  def change
    change_column :lists, :permissions, :string
  end
end
