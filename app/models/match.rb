class Match < ApplicationRecord    
  
  validates :title, :start, presence: true
  validates :title, length: { maximum: 32 }
  validates :description, length: { maximum: 128 }  
  
  belongs_to :left, :class_name => 'Team', :foreign_key => 'left_id', optional: true
  belongs_to :right, :class_name => 'Team', :foreign_key => 'right_id', optional: true
    
  def lock?
    return self.start.past?
  end
end
