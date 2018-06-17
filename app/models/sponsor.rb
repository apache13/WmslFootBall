class Sponsor < ApplicationRecord

  validates :name, :code, presence: true
  validates :code, uniqueness: true

  validates :name, length: { maximum: 64 }
  validates :code, length: { maximum: 8 }
  validates :url, length: { maximum: 128 }

  validates :images, file_size: { less_than_or_equal_to: 1.megabyte }, file_content_type: { allow: ['image/jpeg', 'image/png'] }

  mount_uploaders :images, SponsorUploader
  serialize :images, JSON
  
  def show?
    if !self.enable || self.start.future? || self.end.past?
      return false
    else
      return true
    end    
  end
  
end
