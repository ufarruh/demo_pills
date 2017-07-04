# Pharmacy.delete_all
# Drug.delete_all
# DrugCategory.delete_all
# Category.delete_all

# require 'json'

# 1.upto(12) do |i|

#   json_text = File.read(Rails.root.join("lib", "seeds", "drug#{i}.json"))

#   json = JSON.parse(json_text)


#   json.each do |row|
#     drug = Drug.new
#     drug.id = row["id_drug"]
#     drug.name_rus = row["name_rus"]
#     drug.name_eng = row["name_eng"]
#     drug.packaging = row["packaging"]
#     drug.pharmacology_action = row["pharmacology_action"]
#     drug.indications = row["indications"]
#     drug.release_form = row["release_form"]
#     drug.pharmacodynamics = row["pharmacodynamics"]
#     drug.pharmacokinetics = row["pharmacokinetics"]
#     drug.during_pregnancy = row["during_pregnancy"]
#     drug.in_impaired_renal_function = row["in_impaired_renal_function"]
#     drug.contraindications = row["contraindications"]
#     drug.side_effects = row["side_effects"]
#     drug.dosing = row["dosing"]
#     drug.overdose = row["overdose"]
#     drug.interactions = row["interactions"]
#     drug.precautions = row["precautions"]
#     drug.cautions = row["cautions"]
#     drug.storage_conditions = row["storage_conditions"]
#     drug.best_before = row["best_before"]
#     drug.special_cases = row["special_cases"]

#     drug.save!
#     puts "#{drug.id}, #{drug.name_rus} saved"
#   end

#   puts "There are now #{Drug.count} rows in the transactions table"
# end

# # ATC Class ie Category


# json_text = File.read(Rails.root.join("lib", "seeds", "atc_class.json"))

# json = JSON.parse(json_text)

# json.each do |atc|
#   c = Category.new
#   c.id = atc["id_atc_class"]
#   c.name_rus = atc["name_rus"]

#   c.save!
# end


# # ATC Link ie DrugCategory

# json_text = File.read(Rails.root.join("lib", "seeds", "drug_atc_class.json"))

# json = JSON.parse(json_text)

# json.each do |atc|
#   dc = DrugCategory.new
#   dc.id = atc["id_atc_drug_link"]
#   dc.drug_id = atc["id_drug"]
#   dc.category_id = atc["id_atc_class"]

#   dc.save!
# end




# Drug.all.each do |drug|
#   drug.name_rus = nil if drug.name_rus == "NULL"
#   drug.name_eng = nil if drug.name_eng == "NULL"
#   drug.packaging = nil if drug.packaging == "NULL"
#   drug.pharmacology_action = nil if drug.pharmacology_action == "NULL"
#   drug.indications = nil if drug.indications == "NULL"
#   drug.release_form = nil if drug.release_form == "NULL"
#   drug.pharmacodynamics = nil if drug.pharmacodynamics == "NULL"
#   drug.pharmacokinetics = nil if drug.pharmacokinetics == "NULL"
#   drug.during_pregnancy = nil if drug.during_pregnancy == "NULL"
#   drug.in_impaired_renal_function = nil if drug.in_impaired_renal_function == "NULL"
#   drug.contraindications = nil if drug.contraindications == "NULL"
#   drug.side_effects = nil if drug.side_effects == "NULL"
#   drug.dosing = nil if drug.dosing == "NULL"
#   drug.overdose = nil if drug.overdose == "NULL"
#   drug.interactions = nil if drug.interactions == "NULL"
#   drug.precautions = nil if drug.precautions == "NULL"
#   drug.cautions = nil if drug.cautions == "NULL"
#   drug.storage_conditions = nil if drug.storage_conditions == "NULL"
#   drug.best_before = nil if drug.best_before == "NULL"
#   drug.special_cases = nil if drug.special_cases == "NULL"
#   drug.save!
# end



# json_text = File.read(Rails.root.join("lib", "seeds", "ingredient.json"))
# json = JSON.parse(json_text)


# Ingredient.delete_all
# DrugIngredient.delete_all

# json.each do |ing|
#   i = Ingredient.new
#   i.id = ing["id_active_ingredient"]
#   i.name_rus = ing["name_rus"]
#   i.name_eng = ing["name_eng"]
#   i.save!

#   puts "#{i.name_rus} saved!"

# end


# json_text = File.read(Rails.root.join("lib", "seeds", "drug_ingredient.json"))
# json = JSON.parse(json_text)

# json.each do |ding|
#   d = DrugIngredient.new
#   d.id = ding["id_drug_active_ingredient_link"]
#   d.drug_id = ding["id_drug"]
#   d.ingredient_id = ding["id_active_ingredient"]

#   d.save!

#   puts "DrugIngredient with id: #{d.id} saved!"  
# end



Nozology.delete_all
DrugNozology.delete_all

json_text = File.read(Rails.root.join("lib", "seeds", "nozology.json"))
json = JSON.parse(json_text)


json.each do |noz|
  n = Nozology.new
  n.id = noz["id_nozology"]
  n.name_rus = noz["name_rus"]

  n.save!

  puts "Nozology  #{n.name_rus} saved!"  
end


json_text = File.read(Rails.root.join("lib", "seeds", "drug_nozology_link.json"))
json = JSON.parse(json_text)

json.each do |dnoz|
  dn = DrugNozology.new
  dn.id = dnoz["id_drug_nozology_link"]
  dn.nozology_id = dnoz["id_nozology"]
  dn.drug_id = dnoz["id_drug"]

  dn.save!

  puts "Saved #{dn.id}"
end


























