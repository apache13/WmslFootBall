class Config < ApplicationRecord
  
  validates :key, presence: true
  validates :key, uniqueness: true
  validates :value, length: { maximum: 256 }
      
end
