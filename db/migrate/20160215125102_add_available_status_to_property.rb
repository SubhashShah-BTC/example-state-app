class AddAvailableStatusToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :available, :boolean
    add_column :properties, :sold_or_rented_on, :date
    add_column :properties, :customer_id, :integer
  end
end
