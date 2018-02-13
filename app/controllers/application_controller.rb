class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  WillPaginate.per_page = 10
  
  private
  def current_user
    if(User.exists?(session[:user_id]))
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      @current_user = false
    end
  end
  
  def require_login_permission
    if(current_user != false)
      logger.debug 'uid : '+current_user.uid
      logger.debug 'original_url   : '+request.original_url
      if(session[:return_to] != nil)
        redirect_to(session[:return_to])
      end
      session.delete(:return_to)
    else
      logger.debug 'store original_url   : '+request.original_url
      session[:return_to] = request.original_url
      redirect_to({ action: 'login' , :controller=>"sessions"})
    end
  end
  
  def require_login_permission_and_admin
    if(current_user != false && (current_user.admin == true || current_user.uid == ENV['ROOT_UID']) )
      logger.debug 'uid : '+current_user.uid
      logger.debug 'original_url   : '+request.original_url
      if(session[:return_to] != nil)
        redirect_to(session[:return_to])
      end
      session.delete(:return_to)
    else
      render file: "#{Rails.root}/public/422.html", layout: false, status: 422
    end
  end
  
end
