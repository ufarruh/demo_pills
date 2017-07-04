class AddColumnToDrugs < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs, :rank, :integer, default: 0
  end
end
