class ChangeColumnNameInItemTable < ActiveRecord::Migration
  def change
    rename_column :items, :user_id, :list_id
  end
end
