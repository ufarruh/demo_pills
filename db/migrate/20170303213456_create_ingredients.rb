class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name_rus
      t.string :name_eng

      t.timestamps
    end
  end
end
