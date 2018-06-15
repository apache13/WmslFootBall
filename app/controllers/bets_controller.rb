class BetsController < ApplicationController
  before_action :require_login_permission_and_admin, except: [:show, :new, :edit, :create, :update]
  before_action :require_login_permission, only: [:show, :new, :edit, :create, :update]
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  # GET /bets
  # GET /bets.json
  def index        
    if params[:match].present? && params[:user].present?
        @bets = Bet.where("match_id = ?","#{params[:match]}").where("user_id = ?","#{params[:user]}").order(:match_id).paginate(:page => params[:page], :per_page => 100)
    else
      if params[:match].present?
        @bets = Bet.where("match_id = ?","#{params[:match]}").order(:match_id).paginate(:page => params[:page], :per_page => 100)
      else
        if params[:user].present?
          @bets = Bet.where("user_id = ?","#{params[:user]}").order(:match_id).paginate(:page => params[:page], :per_page => 100)
        else
          @bets = Bet.order(:match_id).paginate(:page => params[:page], :per_page => 100)
        end 
      end
    end        
    #@bets.sort_by{|b| [b.match.start]}    
  end

  # GET /bets/1
  # GET /bets/1.json
   def show
    respond_to do |format|
      if @bet.public?
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
    @bet = Bet.new
    
    if params[:match].present?
      @bet.match = Match.find(params[:match])        
    end
        
    @bet.user = User.find(session[:user_id])
    @bet_data = bet_result_data(@bet)    
    @modal = params[:modal].present? ? true:false  
                        
    respond_to do |format|
      if @modal          
        format.html {render :new, layout: false}
      else 
        format.html {render :new}
      end
    end
           
  end
  
  # GET /bets/1/edit
  def edit    
        
    @user = User.find(session[:user_id])
    @bet.user = @user    
    @bet_data = bet_result_data(@bet)  
    @modal = params[:modal].present? ? true:false
     
    respond_to do |format|
      if @modal
        format.html {render :edit, layout: false}
      else
        format.html {render :edit}
      end
    end

  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)    
    @bet.user = User.find(session[:user_id])
    @modal = params[:modal].present? ? true:false
    
    respond_to do |format|
      if @bet.save
        if @modal
          format.html { redirect_to :root }          
        else
          format.html { redirect_to @bet, notice: 'Bet was successfully created.' }  
        end                         
        format.json { render :show, status: :created, location: @bet }
      else
        if @modal
          format.html { redirect_to :root }  
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
                                       
    respond_to do |format|
      @modal = params[:modal].present? ? true:false
      if !@bet.owner?(User.find(session[:user_id]))
        format.html { redirect_to '/404' } 
      end
      
      if @bet.update(bet_params)
        if @modal
          format.html { redirect_to :root }
        else
          format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @bet }
      else
        if @modal
          format.html { redirect_to :root }  
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
    respond_to do |format|      
      if @bet.public?  
        format.html { redirect_to '/404' } 
      end      
      @bet.destroy            
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
        if bet.match.nil?
          return [[-1,'Left'],[0,'Draw'],[1,'Right']]
        else
          if bet.match.knockout?
            return [[-1,bet.match.left.nil? ? ('Left'):(bet.match.left.name)],[1,bet.match.right.nil? ? ('Right'):(bet.match.right.name)]]
          else
            return [[-1,bet.match.left.nil? ? ('Left'):(bet.match.left.name)],[0,'Draw'],[1,bet.match.right.nil? ? ('Right'):(bet.match.right.name)]] 
          end  
        end
        
    end
    
end
