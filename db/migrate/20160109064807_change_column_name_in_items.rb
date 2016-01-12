class ChangeColumnNameInItems < ActiveRecord::Migration
  def change
    rename_column :items, :complete, :completed
  end
end
