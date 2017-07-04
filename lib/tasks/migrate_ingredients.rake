require 'csv'

def check_null(value)
  value == 'NULL' ? '' : value
end

task migrate_ingredients: :environment do
  csv_text = File.read(File.join(Rails.root, 'lib', 'seeds', 'drugs_ingredients.csv'))
  csv_text = csv_text.gsub('\"', '""')
  csv = CSV.parse(csv_text, :headers => true, :col_sep => '&&&')
  csv.each do |item|
    ingredient = {
      id: check_null(item['id_active_ingredient']),
      name_eng: check_null(item['name_eng']),
      name_rus: check_null(item['name_rus'])
    }
    puts "Create for ingredient with id #{ingredient[:id]}"
    Ingredient.create!(ingredient)
  end
end
