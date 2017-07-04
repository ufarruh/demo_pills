class RenameColumnOfPharmacy < ActiveRecord::Migration[5.0]
  def change
    rename_column :pharmacies, :region_id, :region
  end
end
