class Reservation < ApplicationRecord
  belongs_to :guest
  has_many :occupied_rooms, dependent: :delete_all
  
  validates :date_in, presence: true
  validates :date_out, presence: true  

  def self.todays_arrivals
    today = Date.today
    reservations_today = Reservation.where(date_in: today)

    guests_today = reservations_today.map do |res|
      res.guest
    end
    guests_today
  end 
end 