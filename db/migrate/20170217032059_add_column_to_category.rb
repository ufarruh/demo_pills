class AddColumnToCategory < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :rank, :integer, default: 0
  end
end
