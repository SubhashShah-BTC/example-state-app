class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :description
      t.date :established_on
      t.integer :available_for, null: false, default: 0

      t.timestamps null: false
    end
  end
end
