class Drug < ApplicationRecord
  has_many :drug_categories
  has_many :categories, through: :drug_categories
  
  has_many :pharmacy_drugs
  has_many :pharmacies, through: :pharmacy_drugs

  has_many :drug_ingredients
  has_many :ingredients, through: :drug_ingredients

  has_many :favorite_drugs
  has_many :favorited_by, through: :favorite_drugs, source: :user 
	
  has_many :drug_nozologies
  has_many :nozologies, through: :drug_nozologies, source: :nozology
  
  def self.query(term)
    where("name_eng ILIKE :drug or name_rus ILIKE :drug ", :drug => "%#{term}%")
  end

end
