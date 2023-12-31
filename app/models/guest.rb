class Guest < ApplicationRecord
  belongs_to :property
  has_many :reservations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :phone_number, presence: true

  # def current_property
  #   binding.pry
  # end 
end 