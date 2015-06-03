class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :stores, :products
  end
end
