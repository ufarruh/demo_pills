class CreatePharmacyDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :pharmacy_drugs do |t|
      t.integer :drug_id
      t.integer :pharmacy_id

      t.timestamps
    end

    add_index :pharmacy_drugs, [:drug_id, :pharmacy_id]
  end
end
