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
  
  def random_result   
      logger.info "random result for match #{self.title}"      
      if self.left.nil? || self.right.nil?
        return  
      else
        
        result = [-1,0,1].shuffle.first
        left_score = 0
        right_score = 0
        
        if result < 0
          right_score = [0,1,2,3].shuffle.first
          left_score = right_score + [0,1,2,3].shuffle.first
        else
          if result > 0
            left_score = [0,1,2,3].shuffle.first
            right_score = left_score + [0,1,2,3].shuffle.first  
          else
            left_score = [0,1,2,3].shuffle.first
            right_score = left_score
          end
        end        
        
        self.update(result: result \
        , left_score: left_score \
        , right_score: right_score \
        , yellow_card: [true,false].shuffle.first \
        , red_card: [true,false].shuffle.first \
        , own_goal: [true,false].shuffle.first \
        , extra_time: [true,false].shuffle.first \
        , penalty: [true,false].shuffle.first)
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
