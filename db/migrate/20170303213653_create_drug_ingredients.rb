class CreateDrugIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :drug_ingredients do |t|
      t.integer :drug_id
      t.integer :ingredient_id

      t.timestamps
    end

    add_index :drug_ingredients, [:drug_id, :ingredient_id]
  end
end
