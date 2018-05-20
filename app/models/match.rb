class Match < ApplicationRecord    
  
  validates :title, :start, presence: true
  validates :title, length: { maximum: 64 }
  validates :description, :live, length: { maximum: 128 }      
  validate :validate_live
    
  belongs_to :left, :class_name => 'Team', :foreign_key => 'left_id', optional: true
  belongs_to :right, :class_name => 'Team', :foreign_key => 'right_id', optional: true
    
  def lock?
    return self.start.past?
  end
  
  def random_bets(caller)
      logger.info "Random bets for match #{self.title} by #{caller.name}"                        
      users = User.all
      users.each do |user|        
        Bet.random(caller, user, self)        
      end            
  end
  
  def user_bet_count
    return Bet.where(match: self).length()
  end
  
  def total_bet_count
    return User.count()
  end
  
  def bet_statistic
    bets = Bet.where(match: self)
    left = 0
    draw = 0
    right = 0    
    bets.each do |bet|
      if bet.bet > 0
        right = right + 1
      else
        if bet.bet < 0
          left = left + 1
        else
          draw = draw + 1
        end 
      end
    end
    
    if bets.length > 0
      left_percent = left*100/bets.length
      draw_percent = draw*100/bets.length
      right_percent = right*100/bets.length
      return "#{left_percent}%, #{draw_percent}%, #{right_percent}%"
    else
      return "n/a, n/a, n/a"
    end            
    
  end
  
   private

  def validate_live
    support = ['amarin', 'gmm25', 'mcot9', 'nation22', 'nbt11', 'one', 'thaipbs', 'true4u', 'tv_thairath', 'tv_workpoint23', 'tv3', 'tv3family', 'tv3sd', 'tv5', 'tv7', 'tv8']
    if !self.live.nil?
      self.live.split(",").each do |live|
        if !support.include?(live)        
          errors.add(:match,"live channel #{live} not supported.")
          throw(:abort)
        end
      end
    end
  end
end
