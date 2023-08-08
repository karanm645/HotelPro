class Room < ApplicationRecord
  belongs_to :property
  
  validates :room_type, presence: true
  validates :price, presence: true  
  # validates :smoking, presence: true
  validates :count, presence: true
  validates :room_number, presence: true
end 