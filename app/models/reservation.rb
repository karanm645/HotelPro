class Reservation < ApplicationRecord
  belongs_to :guest
  has_many :occupied_rooms, dependent: :delete_all
  
  validates :date_in, presence: true
  validates :date_out, presence: true  
end 