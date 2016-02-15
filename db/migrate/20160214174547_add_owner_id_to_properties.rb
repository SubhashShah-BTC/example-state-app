class AddOwnerIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :owner_id, :integer, null: false
    add_index :properties, :owner_id
  end
end
