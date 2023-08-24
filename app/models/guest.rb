class Guest < ApplicationRecord
  belongs_to :property
  has_many :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :phone_number, presence: true
end 