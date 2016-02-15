class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :property

      t.timestamps null: false
    end
  end
end
