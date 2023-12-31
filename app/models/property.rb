class Property < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :guests, dependent: :delete_all
  
  validates :name, presence: true
  validates :street, presence: true  
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :phone_number, presence: true
end 