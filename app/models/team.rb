class Team < ApplicationRecord  
  
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true
  validates :name, length: { maximum: 32 }
  validates :code, length: { maximum: 3 }
  
  belongs_to :group
  
end
