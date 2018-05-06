class SessionsController < ApplicationController  
      
  def create
    auth = request.env["omniauth.auth"]    
    
    #endRegisterDateTime = DateTime.parse(Config.find_by_key('CLOSE_REGISTER_DATETIME').value)
    #logger.debug "endRegisterDateTime : "+endRegisterDateTime.to_s+" future? -> "+endRegisterDateTime.future?.to_s
                   
    #if endRegisterDateTime.future?
    user = User.where(:provider => auth['provider'],:uid => auth['uid']).first || User.create_with_omniauth(auth)
    #else
    #  user = User.where(:provider => auth['provider'],:uid => auth['uid']).first
    #end    
    
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
  end
  
end
