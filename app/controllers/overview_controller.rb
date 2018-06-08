class OverviewController < ApplicationController
  
  before_action :require_login_permission
  
  def index
    @table = User.all.sort_by{|u| [-u.pts.to_i,u.id]}        
    @matches = Match.all
    if !session[:user_id].nil?
      @user = User.find_by_id(session[:user_id])  
    end    
    
    begin
      @leagueTable = LeagueTable.find(Config.find_by_key('API_COMPETITION_ID').value.to_i)
    rescue => error
      logger.error error.inspect
      @leagueTable = nil
    end        
    
  end
  
  # GET /bet
  def bet
    user = User.find(session[:user_id])
    match = Match.find(params[:match_id])    
                  
    if !user.nil? && !match.nil?                   
      if Bet.exists?(match: match,user: user)
        @bet = Bet.find_by(match: match, user: user)
        redirect_to edit_bet_path(@bet, :modal=>'true')
      else 
        redirect_to new_bet_path(:match=>match, :modal=>'true') 
      end           
    end
    
  end
  
end
