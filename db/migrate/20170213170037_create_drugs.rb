class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string :name_rus
      t.string :name_eng
      t.string :packaging
      t.text :pharmacology_action
      t.text :indications
      t.text :release_form
      t.text :pharmacodynamics
      t.text :pharmacokinetics
      t.text :during_pregnancy
      t.text :in_impaired_renal_function
      t.text :contraindications
      t.text :side_effects
      t.text :dosing
      t.text :overdose
      t.text :interactions
      t.text :precautions
      t.text :cautions
      t.text :storage_conditions
      t.string :best_before
      t.text :special_cases

      t.timestamps
    end
  end
end
