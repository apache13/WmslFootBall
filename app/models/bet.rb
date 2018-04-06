class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user
    
  validates :user, uniqueness: { scope: :match}
  validates :match, :user, :bet, :bet_left_score, :bet_right_score , presence: true  
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
    
    if self.yellow_card == self.match.yellow_card
      if self.yellow_card?        
        main_score += Config.find_by_key('BET_MAIN_YELLOW_CARD_SCORE').value.to_i
      else
        main_score += Config.find_by_key('BET_MAIN_NO_YELLOW_CARD_SCORE').value.to_i
      end      
    end
    
    if self.red_card == self.match.red_card
      if self.red_card?        
        main_score += Config.find_by_key('BET_MAIN_RED_CARD_SCORE').value.to_i
      else
        main_score += Config.find_by_key('BET_MAIN_NO_RED_CARD_SCORE').value.to_i
      end      
    end
    
    if self.own_goal == self.match.own_goal
      if self.own_goal        
        main_score += Config.find_by_key('BET_MAIN_OWN_GOAL_SCORE').value.to_i
      else
        main_score += Config.find_by_key('BET_MAIN_NO_OWN_GOAL_SCORE').value.to_i
      end      
    end
    
    if self.match.knockout?
      if self.extra_time == self.match.extra_time
        if self.extra_time?        
          main_score += Config.find_by_key('BET_MAIN_EXTRA_TIME_SCORE').value.to_i
        else
          main_score += Config.find_by_key('BET_MAIN_NO_EXTRA_TIME_SCORE').value.to_i
        end   
      end
      
      if self.penalty == self.match.penalty
        if self.penalty?        
          main_score += Config.find_by_key('BET_MAIN_PENALTY_PERCENT').value.to_i
        else
          main_score += Config.find_by_key('BET_MAIN_NO_PENALTY_PERCENT').value.to_i
        end     
      end
      
    end 
    
    bonus_score = 0

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
        errors.add(:bet,"can't be zero in knockout stage")
      end
    end
  end
  
end
