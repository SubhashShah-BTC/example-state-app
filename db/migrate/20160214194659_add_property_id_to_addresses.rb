class AddPropertyIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :property_id, :integer
  end
end
