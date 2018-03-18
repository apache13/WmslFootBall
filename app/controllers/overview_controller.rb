class OverviewController < ApplicationController
  
  before_action :require_login_permission
  
  def index
    @table = User.all.sort {|a,b| b.pts <=> a.pts}        
    @matches = Match.all
    if !session[:user_id].nil?
      @info = User.find_by_id(session[:user_id])  
    end    
  end
  
  # GET /user_bet
  def user_bet
    user = User.find(session[:user_id])
    match = Match.find(params[:match_id])    
           
    if Bet.exists?(match: match,user: user)
      @bet = Bet.find_by(match: match,user: user)
    else
      @bet = Bet.new
      @bet.match = match 
      @bet.user = user  
    end    
    respond_to do |format|
      format.html { render :bet, layout: false }
    end
    
  end
  
  # POST /user_create_bet
  def user_create_bet
    user = User.find(session[:user_id])    
    match = Match.find(params[:match_id])    
        
    if Bet.exists?(match: match,user: user)
      @bet = Bet.find_by(match: match,user: user)
      @bet.update(bet: params[:bet])
    else
      @bet = Bet.new
      @bet.match = match 
      @bet.user = user  
      @bet.bet = params[:bet]
      @bet.save
    end  
    respond_to do |format|
      format.html { render :show, notice: 'Bet was successfully created.', layout: false}      
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:bet,:match_id)
    end
  
end
