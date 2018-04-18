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
  
  def pts_final_result
    score = 0
    if self.bet == self.match.result
      score = Config.find_by_key('BET_MAIN_FINAL_RESULT_SCORE').value.to_i    
    end
    return score
  end
  
  def pts_left_team
    score = 0
    if self.bet_left_score == self.match.left_score
      score = Config.find_by_key('BET_MAIN_LEFT_TEAM_SCORE').value.to_i    
    end
    return score
  end
  
  def pts_right_team
    score = 0
    if self.bet_right_score == self.match.right_score
      score = Config.find_by_key('BET_MAIN_RIGHT_TEAM_SCORE').value.to_i    
    end
    return score
  end
  
  def pts_yellow_card
    score = 0
    if self.yellow_card == self.match.yellow_card
      if self.yellow_card?        
        score = Config.find_by_key('BET_MAIN_YELLOW_CARD_SCORE').value.to_i
      else
        score = Config.find_by_key('BET_MAIN_NO_YELLOW_CARD_SCORE').value.to_i
      end      
    end
    return score
  end
  
  def pts_red_card
    score = 0
    if self.red_card == self.match.red_card
      if self.red_card?        
        score = Config.find_by_key('BET_MAIN_RED_CARD_SCORE').value.to_i
      else
        score = Config.find_by_key('BET_MAIN_NO_RED_CARD_SCORE').value.to_i
      end      
    end
    return score
  end
  
  def pts_own_goal
    score = 0
    if self.own_goal == self.match.own_goal
      if self.own_goal       
        score = Config.find_by_key('BET_MAIN_OWN_GOAL_SCORE').value.to_i
      else
        score = Config.find_by_key('BET_MAIN_NO_OWN_GOAL_SCORE').value.to_i
      end      
    end
    return score
  end
  
  def pts_extra_time
    score = 0
    if self.extra_time == self.match.extra_time
        if self.extra_time?         
        score = Config.find_by_key('BET_MAIN_EXTRA_TIME_SCORE').value.to_i
      else
        score = Config.find_by_key('BET_MAIN_NO_EXTRA_TIME_SCORE').value.to_i
      end      
    end
    return score
  end
  
  def pts_penalty
    score = 0
    if self.penalty == self.match.penalty
        if self.penalty?        
        score = Config.find_by_key('BET_MAIN_PENALTY_SCORE').value.to_i
      else
        score = Config.find_by_key('BET_MAIN_NO_PENALTY_SCORE').value.to_i
      end      
    end
    return score
  end
  
  
  def pts      
    
    main_score = pts_final_result + pts_left_team + pts_right_team + pts_yellow_card + pts_red_card + pts_own_goal
    if self.match.knockout?
      main_score = main_score + pts_extra_time + pts_penalty
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
