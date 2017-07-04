class CreatePharmacies < ActiveRecord::Migration[5.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.date :work_hours
      t.string :phone_number
      t.integer :city_id
      t.integer :region_id
      t.string :address

      t.timestamps
    end
  end
end
