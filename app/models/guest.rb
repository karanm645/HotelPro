class Guest < ApplicationRecord
  belongs_to :property

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :phone_number, presence: true
end 