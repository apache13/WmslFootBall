class Group < ApplicationRecord
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 32 }  
  
  has_many :teams 
end
