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
  
end
