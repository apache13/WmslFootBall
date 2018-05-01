class Match < ApplicationRecord    
  
  validates :title, :start, presence: true
  validates :title, length: { maximum: 64 }
  validates :description, length: { maximum: 128 }  
  
  belongs_to :left, :class_name => 'Team', :foreign_key => 'left_id', optional: true
  belongs_to :right, :class_name => 'Team', :foreign_key => 'right_id', optional: true
    
  def lock?
    return self.start.past?
  end
  
  def random_bets        
      logger.info "random bets for match #{self.title}"      
      if self.left.nil? || self.right.nil?
        return  
      end            
      users = User.all
      users.each do |user|
        if !Bet.exists?(user: user, match: self)
          Bet.random(user, self)
        end
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
  
end
