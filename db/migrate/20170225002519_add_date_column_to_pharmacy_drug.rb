class AddDateColumnToPharmacyDrug < ActiveRecord::Migration[5.0]
  def change
  	add_column :pharmacy_drugs, :exp_date, :datetime
  end
end
