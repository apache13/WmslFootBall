class OverviewController < ApplicationController
  
  before_action :require_login_permission
  
  def index
    @table = User.all.sort {|a,b| b.pts <=> a.pts}        
    @matches = Match.all
    if !session[:user_id].nil?
      @info = User.find_by_id(session[:user_id])  
    end    
  end
  
  # GET /bet
  def bet
    user = User.find(session[:user_id])
    match = Match.find(params[:match_id])    
                  
    if !user.nil? && !match.nil?                   
      if Bet.exists?(match: match,user: user)
        @bet = Bet.find_by(match: match, user: user)
        redirect_to edit_bet_path(@bet)
      else 
        redirect_to new_bet_path(match: match) 
      end           
    end
    
  end
  
end
