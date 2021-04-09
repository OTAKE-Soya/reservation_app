class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :user
  
  validates :user_id, presence: true
  validates :band_id, presence: true, uniqueness: { scope: :user_id} 
  
end