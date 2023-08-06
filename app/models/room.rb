class Room < ApplicationRecord
  belongs_to :property
  
  validates :type, presence: true
  validates :price, presence: true  
  validates :smoking, presence: true
  validates :count, presence: true
end 