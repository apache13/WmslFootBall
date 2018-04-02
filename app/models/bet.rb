class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user
    
  validates :user, uniqueness: { scope: :match}
  validates :match, :user, :bet, presence: true  
  validates :bet, :inclusion => {:in => [-1,0,1]}  
  validate :validate_on_bet
  #before_destroy :validate_before_destroy    
    
  def win?       
    if self.bet == self.match.result
      return true
    else
      return false
    end
  end
  
  def pts      
    
    main_score = 0
    if self.bet == self.match.result
      main_score += Config.find_by_key('BET_MAIN_FINAL_RESULT_SCORE').value.to_i    
    end
    if self.bet_left_score == self.match.left_score
      main_score += Config.find_by_key('BET_MAIN_LEFT_TEAM_SCORE').value.to_i   
    end    
    if self.bet_right_score == self.match.right_score
      main_score += Config.find_by_key('BET_MAIN_RIGHT_TEAM_SCORE').value.to_i
    end
    
    bonus_score = 0
    
    if self.yellow_card == self.match.yellow_card
      bonus_score += main_score*Config.find_by_key('BET_BONUS_YELLOW_CARD_PERCENT').value.to_d/100  
    end
    
    if self.red_card == self.match.red_card
      bonus_score += main_score*Config.find_by_key('BET_BONUS_RED_CARD_PERCENT').value.to_d/100  
    end
    
    if self.penalty == self.match.penalty
      bonus_score += main_score*Config.find_by_key('BET_BONUS_PENALTY_PERCENT').value.to_d/100  
    end
    
    if self.match.knockout?
      if self.extra_time == self.match.extra_time
        bonus_score += main_score*Config.find_by_key('BET_BONUS_EXTRA_TIME_PERCENT').value.to_d/100  
      end  
    end        
    
    logger.debug 'main_score : '+main_score.to_s
    logger.debug 'bonus_score : '+bonus_score.to_s
    
    return main_score+bonus_score
  end
  
  private  
  def validate_before_destroy
    if self.match.lock?
      errors.add(:bet,"not allowed (match is locked on #{self.match.start})")
      throw(:abort)
    end
  end
  
  def validate_on_bet
    if self.match.lock?
      errors.add(:bet,"not allowed (match is locked on #{self.match.start})")
    end
    if !new_record? && self.match_id_changed?
      errors.add(:match,"can't change")
    end
    if !new_record? && self.user_id_changed?
      errors.add(:user,"can't change")
    end    
    if self.match.knockout?
      if self.bet == 0
        errors.add(:bat,"can't be zero in knockout stage")
      end
    end
  end
  
end
