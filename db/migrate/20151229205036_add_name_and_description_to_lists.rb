class AddNameAndDescriptionToLists < ActiveRecord::Migration
  def change
    add_column :lists, :name, :string
    add_column :lists, :description, :text
    add_index :lists, :name
    add_index :lists, :description
  end
end
