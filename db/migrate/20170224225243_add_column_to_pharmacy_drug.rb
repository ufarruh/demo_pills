class AddColumnToPharmacyDrug < ActiveRecord::Migration[5.0]
  def change
  	add_column :pharmacy_drugs, :price, :integer, default: 10
  end
end
