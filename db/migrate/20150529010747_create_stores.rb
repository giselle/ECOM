class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :description

      t.timestamps null: false
    end
  end
end