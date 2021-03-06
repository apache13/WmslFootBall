class TeamsController < ApplicationController  
  before_action :require_login_permission_and_admin, except: [:show, :players]  
  before_action :require_login_permission, only: [:show, :players]
  before_action :set_team, only: [:show, :players, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    # @teams = Team.all    
    if params[:name].present? && params[:code].present?
        @teams = Team.where("name like ?","%#{params[:name]}%").where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
    else
      if params[:name].present?
        @teams = Team.where("name like ?","%#{params[:name]}%").paginate(:page => params[:page])
      else
        if params[:code].present?
          @teams = Team.where("code like ?","%#{params[:code]}%").paginate(:page => params[:page])
        else
          @teams = Team.paginate(:page => params[:page])
        end 
      end
    end
    
  end
  
  # GET /teams/1/players.json
  def players
    begin
      @players = Player.find(@team.api_id).players
    rescue => error
      logger.error error.inspect
      @players = nil
    end
    
    respond_to do |format|
      format.json { render json: @players }
    end
  end
  
  # GET /teams/1
  # GET /teams/1.json
  def show
    
    begin
      @players = Player.find(@team.api_id).players
    rescue => error
      logger.error error.inspect
      @players = nil
    end
    
    @fans = User.where("team_id = ?",@team)    
         
    respond_to do |format|
      if params[:modal].present?        
        format.html { render :show_modal, layout: false }
      else
        format.html { render :show }
      end
    end
    
    
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :code, :group_id, :club, :api_id)
    end
end
