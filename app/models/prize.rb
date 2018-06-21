class Prize < ApplicationRecord
  
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  
  validates :name, length: { maximum: 64 }
  validates :code, length: { maximum: 8 }
  validates :sponsor, length: { maximum: 32 }
  validates :description, length: { maximum: 512 }
  
  belongs_to :match, optional: true 
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id', optional: true
  
  mount_uploaders :images, PrizeUploader
  serialize :images, JSON
  
  validates :images, file_size: { less_than_or_equal_to: 1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png'] } 
  
end
