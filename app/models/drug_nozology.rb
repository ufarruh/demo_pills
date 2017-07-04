class DrugNozology < ApplicationRecord
  belongs_to :drug
  belongs_to :nozology
end
