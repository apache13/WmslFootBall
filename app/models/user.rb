class User < ApplicationRecord

  validates :uid, uniqueness: true
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
    
  def image_ssl
    self.image.sub! 'http://','https://'
  end

end
