class Pharmacy < ApplicationRecord
  has_many :pharmacy_drugs
  has_many :drugs, through: :pharmacy_drugs
  belongs_to :user, optional: true
  belongs_to :city, optional: true
end
