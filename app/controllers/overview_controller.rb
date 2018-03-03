class OverviewController < ApplicationController
  
  before_action :require_login_permission
  
  def index
    @table = User.all.sort {|a,b| b.pts <=> a.pts}        
    @matches = Match.all
    if !session[:user_id].nil?
      @info = User.find_by_id(session[:user_id])  
    end
    
  end
end
