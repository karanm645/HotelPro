class Room < ApplicationRecord
  belongs_to :property
  has_many :occupied_rooms, dependent: :delete_all
  
  validates :room_type, presence: true
  validates :price, presence: true  
  # validates :smoking, presence: true
  validates :room_number, presence: true
end 