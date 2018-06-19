class User < ApplicationRecord

  belongs_to :champion, :class_name => 'Team', :foreign_key => 'team_id', optional: true
  
  validates :uid, uniqueness: true
  validates :top_goal_scorer, length: { maximum: 64 }
  validates :nickname, :party, length: { maximum: 32 }
    
  def display_payment
    if self.payment.nil?
       return 'Wait'
    else
       return self.payment ? 'Approve':'Wait'
    end
  end
  
  def display_name
    if self.nickname.nil?
      return self.name
    else
      return "#{self.name} (#{self.nickname})"
    end
  end  
    
  def admin?    
    return self.admin
  end    
    
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
        user.image = auth['info']['image'] || ""
      end
      if ENV['ROOT_UID']
        if ENV['ROOT_UID'].eql?(user.uid)
        user.admin = true
        else
        user.admin = false
        end
      end
    end
  end

  def pts
    total = 0
    bets = Bet.where(user: self)    
    bets.each do |bet|    
      total = total + bet.pts      
    end
    return total
  end
  
  def p
    total = 0
    matches = Match.all    
    matches.each do |match| 
      if !match.result.nil?   
        total = total + 1
      end      
    end
    return total
  end
  
  def rank
    standings = User.all.sort_by{|u| [-u.pts.to_i,u.id]}
    standings.each_with_index do |player, index|
       if player.id == self.id
         return index + 1
       end
    end
    return -1
  end
  
  def ratio_win    
    count = 0
    win = 0
    bets = Bet.where(user: self)    
    bets.each do |bet|    
      if bet.match.result.nil?        
        next                  
      end          
      if bet.win?
        win = win +1      
      end      
      count = count + 1      
    end
    
    if count == 0
      return 'n/a'
    else
      return win*100/count
    end
        
  end
  
  def continuous_win
    win = 0
    bets = Bet.where(user: self).sort_by{|b| [b.match.start]}    
    bets.each do |bet|    
      if bet.match.final?        
        if bet.win?
          win = win + 1
        else
          win = 0
        end                   
      end                      
    end
    return win
  end
  
  def continuous_loss
    loss = 0
    bets = Bet.where(user: self).sort_by{|b| [b.match.start]}    
    bets.each do |bet|    
      if bet.match.final?        
        if !bet.win?
          loss = loss + 1
        else
          loss = 0
        end                   
      end                      
    end
    return loss
  end
  
  def prizes
    return @prizes = Prize.where("user_id = ?",self)
  end

end
