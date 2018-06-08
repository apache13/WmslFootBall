class BetsController < ApplicationController
  before_action :require_login_permission_and_admin, except: [:show, :new, :edit, :create, :update]
  before_action :require_login_permission, only: [:show, :new, :edit, :create, :update]
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.paginate(:page => params[:page])
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
    
    accessible = false                                    
    if @bet.match.result.nil?
      @user = User.find(session[:user_id])
      if @user.admin?
        accessible = true
      else
        accessible = false
      end  
    else
        accessible = true          
    end
    
    respond_to do |format|
      if accessible == true
        if params[:modal].present?        
          format.html { render :show_modal, layout: false }
        else
          format.html { render :show }
        end
      else
        format.html { redirect_to '/404' }        
      end
    end
    
  end

  # GET /bets/new
  def new                         
    @user = User.find(session[:user_id])
    if @user.admin?
      @bet = Bet.new
      @admin_mode = true;
    else
      @admin_mode = false;
      match = Match.find(params[:match])   
      if !match.nil?
        @bet = Bet.new    
        @bet.user = @user
        @bet.match = match        
        @bet_data = bet_result_data(@bet)                            
      end
      
      respond_to do |format|
        if params[:modal].present?
          @modal = true
          format.html {render :new, layout: false}
        else
          format.html {render :new}
        end
      end
      
    end      
  end
  
  # GET /bets/1/edit
  def edit    
    
    #puts params.inspect
    @user = User.find(session[:user_id])    
    if @user.admin?
      @admin_mode = true;
    else
      @admin_mode = false;
      @bet_data = bet_result_data(@bet)
      
      respond_to do |format|
        if params[:modal].present?
          @modal = true
          format.html {render :edit, layout: false}
        else
          format.html {render :edit}
        end
      end
      
    end
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)
    @user = User.find(session[:user_id])   
    
    if !@user.admin?
       @bet.user = @user
    end
    
    respond_to do |format|
      if @bet.save
        if params[:modal].present?
          format.html { redirect_to :root }          
        else
          format.html { redirect_to @bet, notice: 'Bet was successfully created.' }  
        end                         
        format.json { render :show, status: :created, location: @bet }
      else
        if params[:modal].present?
          format.html { redirect_to :root, notice: @bet.errors.full_messages}  
        else
          @bet_data = bet_result_data(@bet)
          format.html { render :new }
          format.json { render json: @bet.errors, status: :unprocessable_entity }
        end                
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    @user = User.find(session[:user_id])     
    
    if !@user.admin?      
      @bet.user = @user
    end
    
    puts params.inspect
          
    respond_to do |format|
      if @bet.update(bet_params)
        if @user.admin? && params[:admin].present?
          format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        else
          format.html { redirect_to :root }
        end
        format.json { render :show, status: :ok, location: @bet }
      else
        if params[:modal].present?
          format.html { redirect_to :root, notice: @bet.errors.full_messages}  
        else
          @bet_data = bet_result_data(@bet)
          format.html { render :edit }
          format.json { render json: @bet.errors, status: :unprocessable_entity }
        end 
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:match_id, :user_id, :bet, :bet_left_score, :bet_right_score, :yellow_card, :red_card, :own_goal, :extra_time, :penalty)
    end
    
    def bet_result_data(bet)
        if bet.match.knockout?
          return [[-1,bet.match.left.nil? ? ('Left'):(bet.match.left.name)],[1,bet.match.right.nil? ? ('Right'):(bet.match.right.name)]]
        else
          return [[-1,bet.match.left.nil? ? ('Left'):(bet.match.left.name)],[0,'Draw'],[1,bet.match.right.nil? ? ('Right'):(bet.match.right.name)]] 
        end
    end
    
end
