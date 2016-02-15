class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building, null: false
      t.string :street,   null: false
      t.string :landmark
      t.string :city,     null: false
      t.string :state,    null: false
      t.string :country,  null: false
      t.string :zip,      null: false

      t.timestamps null: false
    end

    add_index :addresses, :country, name: 'by_country'
  end
end
