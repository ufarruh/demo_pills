class CreateFavoriteDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_drugs do |t|
      t.integer :drug_id
      t.integer :user_id

      t.timestamps
    end

    add_index :favorite_drugs, [:drug_id, :user_id]
  end
end
