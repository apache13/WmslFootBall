class UsersController < ApplicationController  
  before_action :require_login_permission_and_admin, except: [:show, :champion, :top_goal_scorer, :update_champion, :update_top_goal_scorer]
  before_action :require_login_permission, only: [:show, :champion, :top_goal_scorer, :update_champion, :update_top_goal_scorer]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :champion, :top_goal_scorer]

  # GET /users
  # GET /users.json
  def index
        
    # @users = User.all   
    if params[:name].present? && params[:uid].present?
        @users = User.where("name like ?","%#{params[:name]}%").where("uid like ?","%#{params[:uid]}%").paginate(:page => params[:page], :per_page => 100)
    else
      if params[:name].present?
        @users = User.where("name like ?","%#{params[:name]}%").paginate(:page => params[:page], :per_page => 100)
      else
        if params[:uid].present?
          @users = User.where("uid like ?","%#{params[:uid]}%").paginate(:page => params[:page], :per_page => 100)
        else
          @users = User.paginate(:page => params[:page], :per_page => 100)
        end 
      end
    end
    
  end

  # GET /users/1
  # GET /users/1.json
  def show         
    
    @bets = Bet.where("user_id = ?",@user)
    @prizes = Prize.where("user_id = ?",@user)
    
    respond_to do |format|
      if params[:modal].present?        
        format.html { render :show_modal, layout: false }
      else
        format.html { render :show }
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @party = Config.find_by_key('PARTY').value.split(",")
    @gender = ["male","female"]
  end

  # GET /users/1/edit
  def edit
    @party = Config.find_by_key('PARTY').value.split(",")
    @gender = ["male","female"]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def champion
    @teams = Team.all
    render layout: false
  end
  
  def top_goal_scorer
    @teams = Team.all        
    render layout: false
  end
  
  def update_champion
    user_bet_champion_end_time = DateTime.parse(Config.find_by_key('USER_BET_CHAMPION_END_TIME').value)    
    @user = User.find(session[:user_id])  
    respond_to do |format|
      if user_bet_champion_end_time.future?
        @user.update(user_champion_params)
      end      
      format.html { redirect_to :root }      
    end    
  end
  
  def update_top_goal_scorer
    user_bet_top_goal_scorer_end_time = DateTime.parse(Config.find_by_key('USER_BET_TOP_GOAL_SCORER_END_TIME').value)    
    @user = User.find(session[:user_id])  
    respond_to do |format|     
      if user_bet_top_goal_scorer_end_time.future?
        @user.update(user_top_goal_scorer_params)
      end       
      format.html { redirect_to :root }           
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:provider, :uid, :name, :email, :image, :admin, :team_id, :top_goal_scorer, :payment, :party, :nickname, :gender)
    end
    
    def user_champion_params
      params.require(:user).permit(:team_id)
    end
    
    def user_top_goal_scorer_params
      params.require(:user).permit(:top_goal_scorer)
    end
    
end
