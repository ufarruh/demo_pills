class ChangePharmacyColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :pharmacies, :region_id, :string
    change_column :pharmacies, :work_hours, :string
  end
end
