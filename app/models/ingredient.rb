class Ingredient < ApplicationRecord
  has_many :drug_ingredients
  has_many :drugs, through: :drug_ingredients
end
