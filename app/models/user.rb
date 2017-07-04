class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :pharmacy, dependent: :destroy

  has_many :favorite_drugs
  has_many :favorites, through: :favorite_drugs, source: :drug  


  def is_admin?
    self.admin == true
  end
end
