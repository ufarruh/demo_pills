class CreateDrugNozologies < ActiveRecord::Migration[5.0]
  def change
    create_table :drug_nozologies do |t|
      t.integer :nozology_id
      t.integer :drug_id

      t.timestamps
    end

    add_index :drug_nozologies, [:nozology_id, :drug_id]
  end
end
