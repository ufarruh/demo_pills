class CreateNozologies < ActiveRecord::Migration[5.0]
  def change
    create_table :nozologies do |t|
      t.string :name_rus

      t.timestamps
    end

    add_index :nozologies, [:name_rus]
  end
end
