require 'csv'

def check_null(value)
  value == 'NULL' ? '' : value
end

task migrate_ingredient_associations: :environment do
  csv_text = File.read(File.join(Rails.root, 'lib', 'seeds', 'drugs_ingredients_associations.csv'))
  csv_text = csv_text.gsub('\"', '""')
  csv = CSV.parse(csv_text, :headers => true, :col_sep => '&&&')
  csv.each do |item|
    association = {
      id: check_null(item['id_drug_active_ingredient_link']),
      drug_id: check_null(item['id_drug']),
      ingredient_id: check_null(item['id_active_ingredient'])
    }
    puts "Create for association with id #{association[:id]}"
    DrugIngredient.create!(association)
  end
end
