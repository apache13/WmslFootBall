class Bet < ApplicationRecord
  belongs_to :match
  belongs_to :user
    
  validates :user, uniqueness: { scope: :match}
  validates :match, :user, :bet, :bet_left_score, :bet_right_score , presence: true  
  validates :bet, :inclusion => {:in => [-1,0,1]}  
  validate :validate_on_bet
  #before_destroy :validate_before_destroy    

  attr_accessor :caller
  
  def win?       
    if self.bet == self.match.result
      return true
    else
      return false
    end
  end
  
  def owner?(user)
    if self.user.id == user.id
      return true
    else
      return false
    end
  end
  
  def public?
    return self.match.lock?      
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
  
  def bonus_champion?
    if self.match.final? && self.match.knockout?
      champion = self.user.champion
      if !champion.nil?
        if champion.id == self.match.left.id || champion.id == self.match.right.id
          return true
        end
      end      
    end
    return false
  end
  
  def pts_bonus_champion(main_score)                  
    if bonus_champion?
      multiply = Config.find_by_key('BET_BONUS_CHAMPION_MULTIPLY').value.to_f    
      bonus_score = (main_score * multiply).to_i      
      return bonus_score
    else
      return 0  
    end             
  end
  
  def pts      
        
    if self.match.result.nil?
      return 0
    end
    
    main_score = pts_final_result + pts_left_team + pts_right_team + pts_yellow_card + pts_red_card + pts_own_goal
    if self.match.knockout?
      main_score = main_score + pts_extra_time + pts_penalty
    end           
    
    bonus_score = pts_bonus_champion(main_score)

    #logger.info 'main_score : '+main_score.to_s
    #logger.info 'bonus_score : '+bonus_score.to_s
    
    return main_score+bonus_score
  end 
  
  def self.random(caller, user, match)        
    logger.info "Random bets for user #{user.name}"  
    if !Bet.exists?(user: user, match: match)
      logger.info "Auto generate bet."
      Bet.create(user: user, match: match \
      , caller: caller \
      , bet: [-1,0,1].shuffle.first \
      , bet_left_score: [0,1,2,3].shuffle.first \
      , bet_right_score: [0,1,2,3].shuffle.first \
      , yellow_card: [true,false].shuffle.first \
      , red_card: [true,false].shuffle.first \
      , own_goal: [true,false].shuffle.first \
      , extra_time: [true,false].shuffle.first \
      , penalty: [true,false].shuffle.first)
    else
      logger.info "User already bet."
    end
    
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
      if !self.caller.nil? && self.caller.admin?
        logger.info "Caller from admin any bet can created. (skip validate match lock)"
      else
        logger.info "Caller from user any bet after match lock is prohibited."
        errors.add(:bet,"not allowed (match is locked on #{self.match.start})")
        throw(:abort)           
      end      
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
