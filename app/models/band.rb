class Band < ApplicationRecord
  has_many :band_members
  has_many :users, through: :band_members
  has_many :reservations
  accepts_nested_attributes_for :band_members
  
  validates :name, presence: true
  
  def member_included?(member)
    f = false
    self.users.each do |user|
      if user.id == member.id
        f = true
      end
    end
    return f
  end
end
