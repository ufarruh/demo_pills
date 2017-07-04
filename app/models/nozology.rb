class Nozology < ApplicationRecord
  has_many :drug_nozologies
  has_many :drugs, through: :drug_nozologies, source: :drug
  
end
