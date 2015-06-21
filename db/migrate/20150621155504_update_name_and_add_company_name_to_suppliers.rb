class UpdateNameAndAddCompanyNameToSuppliers < ActiveRecord::Migration
  def change
    rename_column :suppliers, :name, :first_name
    add_column :suppliers, :last_name, :string
    add_column :suppliers, :company_name, :string
    rename_column :suppliers, :phone, :phone_number
  end
end
