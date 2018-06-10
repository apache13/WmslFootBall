class User < ApplicationRecord

  belongs_to :champion, :class_name => 'Team', :foreign_key => 'team_id', optional: true
  
  validates :uid, uniqueness: true
  validates :top_goal_scorer, length: { maximum: 64 }
    
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

end
