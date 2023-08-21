class Guest < ApplicationRecord
  
  validates :first_name, presence: true
  validates :last_name, presence: true  
  # validates :smoking, presence: true
  validates :phone_number, presence: true
end 