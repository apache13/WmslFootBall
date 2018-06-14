class SessionsController < ApplicationController  
        
  def create
    auth = request.env["omniauth.auth"]    
    
    user_register_enable = to_bool(Config.find_by_key('USER_REGISTER_ENABLE').value)
    logger.debug "user_register_enable : "+user_register_enable.to_s
                   
    if user_register_enable
      user = User.where(:provider => auth['provider'],:uid => auth['uid']).first || User.create_with_omniauth(auth)
    else
      user = User.where(:provider => auth['provider'],:uid => auth['uid']).first
    end    
    
    if user.nil?
      redirect_to({ action: 'login' , :controller=>"sessions"})
    else
      session[:user_id] = user.id
      redirect_to root_url  
    end
    
  end

  def new_facebook
    redirect_to '/auth/facebook'    
  end

  def new_google
    redirect_to '/auth/google_oauth2'    
  end
  
  def destroy
    reset_session
    redirect_to '/sessions/login'
  end
  
  def login    
    @images = Config.find_by_key('SLIDE_IMAGE').value.split(",")               
  end  
  
end
