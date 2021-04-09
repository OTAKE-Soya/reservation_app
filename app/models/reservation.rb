class Reservation < ApplicationRecord
  belongs_to :band
  
  validates :name, presence: true
  validates :band_id, presence: true
  validates :period, presence: true
  validates :date, presence: true, uniqueness: { scope: :period} 
end
