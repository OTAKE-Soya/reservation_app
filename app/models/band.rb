class Band < ApplicationRecord
  has_many :band_members
  has_many :users, through: :band_members
  
  accepts_nested_attributes_for :band_members
end
