class Reservation < ApplicationRecord
  belongs_to :guest
  has_many :occupied_rooms
  
  validates :date_in, presence: true
  validates :date_out, presence: true  
end 