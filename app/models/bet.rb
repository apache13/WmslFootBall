class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user
  
  
  validates :user, uniqueness: { scope: :match}
  validates :result, presence: true  
  validates :result, :inclusion => {:in => [-1,0,1]}  
  validate :validate_on_bet
    
  before_destroy do
    #if self.match.start.past?
      errors.add(:bet,"not allowed (match is closed on #{self.match.start})")
    #end
    throw(:abort) if errors.present?
  end
  
  private  
  def validate_on_bet
    if self.match.start.past?
      errors.add(:bet,"not allowed (match is closed on #{self.match.start})")
    end
    if !new_record? && self.match_id_changed?
      errors.add(:match,"can't change")
    end
    if !new_record? && self.user_id_changed?
      errors.add(:user,"can't change")
    end    
    if self.match.knockout?
      if self.result == 0
        errors.add(:result,"can't be zero in knockout stage")
      end
    end
  end
  
end
