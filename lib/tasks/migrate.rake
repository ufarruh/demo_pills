require 'csv'

def check_null(value)
  value == 'NULL' ? '' : value
end

task migrate_drug: :environment do
  csv_text = File.read(File.join(Rails.root, 'lib', 'seeds', 'drug.csv'))
  csv_text = csv_text.gsub('\"', '""')
  csv = CSV.parse(csv_text, :headers => true, :col_sep => '&&&')
  csv.each do |item|
    product = {
      id: check_null(item['id_drug']),
      name_eng: check_null(item['name_eng']),
      name_rus: check_null(item['name_rus']),
      packaging: check_null(item['packaging']),
      pharmacology_action: check_null(item['pharmacology_action']),
      indications: check_null(item['indications']),
      release_form: check_null(item['release_form']),
      pharmacodynamics: check_null(item['pharmacodynamics']),
      pharmacokinetics: check_null(item['pharmacokinetics']),
      during_pregnancy: check_null(item['during_pregnancy']),
      in_impaired_renal_function: check_null(item['in_impaired_renal_function']),
      contraindications: check_null(item['contraindications']),
      side_effects: check_null(item['side_effects']),
      special_cases: check_null(item['special_cases']),
      dosing: check_null(item['dosing']),
      overdose: check_null(item['overdose']), 
      interactions: check_null(item['interactions']),
      precautions: check_null(item['precautions']),
      cautions: check_null(item['cautions']),
      storage_conditions: check_null(item['storage_conditions']),
      best_before: check_null(item['best_before']),
    }
    puts "Create for product with id #{product[:id]}"
    Drug.create!(product)
  end
  
end
