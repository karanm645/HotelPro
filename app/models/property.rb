class Property < ApplicationRecord
  belongs_to :user
  has_many :rooms
  
  validates :name, presence: true
  validates :street, presence: true  
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :phone_number, presence: true
end 