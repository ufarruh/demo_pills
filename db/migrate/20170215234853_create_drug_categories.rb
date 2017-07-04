class CreateDrugCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :drug_categories do |t|
      t.integer :drug_id
      t.integer :category_id

      t.timestamps
    end

    add_index :drug_categories, [:drug_id, :category_id]
  end
end
