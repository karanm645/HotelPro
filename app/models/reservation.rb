class Reservation < ApplicationRecord
  belongs_to :guest
  
  validates :date_in, presence: true
  validates :date_out, presence: true  
end 