class ChangeColumnInLists < ActiveRecord::Migration
  def change
    rename_column :lists, :public, :permissions
    change_column :lists, :permissions, :integer
  end
end
