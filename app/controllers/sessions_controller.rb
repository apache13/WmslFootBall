class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]    
    
    if ENV["ENABLE_REGISTER"].present?
      user = User.where(:provider => auth['provider'],:uid => auth['uid']).first || User.create_with_omniauth(auth)
    else
      user = User.where(:provider => auth['provider'],:uid => auth['uid']).first
    end    
    
    if user.nil?
      redirect_to({ action: 'login' , :controller=>"sessions"})
    else
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"  
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
    redirect_to root_url, notice => 'Signed out'
  end
  
  def login    
  end
  
end
