class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user
    
  validates :user, uniqueness: { scope: :match}
  validates :match, :user, :guess, presence: true  
  validates :guess, :inclusion => {:in => [-1,0,1]}  
  validate :validate_on_bet
  before_destroy :validate_before_destroy    
    
  def win?
    if guess == match.result
      return true
    else
      return false
    end
  end
  
  private  
  def validate_before_destroy
    if self.match.close?
      errors.add(:bet,"not allowed (match is closed on #{self.match.start})")
      throw(:abort)
    end
  end
  
  def validate_on_bet
    if self.match.close?
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
        errors.add(:guess,"can't be zero in knockout stage")
      end
    end
  end
  
end
