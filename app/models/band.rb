class Band < ApplicationRecord
  has_many :users, through: :band_members
end
