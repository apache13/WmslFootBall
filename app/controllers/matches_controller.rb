class MatchesController < ApplicationController
  before_action :require_login_permission_and_admin, except: [:show]
  before_action :require_login_permission, only: [:show]
  before_action :set_match, only: [:show, :edit, :update, :destroy, :random_bets, :random_result]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.order(:start).paginate(:page => params[:page])
  end

  # GET /matches/1
  # GET /matches/1.json
  def show                        
    
    @top5 = Bet.where(match: @match).sort_by{|b| [-b.pts, b.created_at]}[0..4] 
    
                    
    respond_to do |format|
      if params[:modal].present?        
        format.html { render :show_modal, layout: false }
      else
        format.html { render :show }
      end
    end
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def random_bets
    caller = User.find(session[:user_id])
    @match.random_bets(caller)
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully random bets.' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:title, :description, :live, :start, :knockout, :left_id, :right_id, :result, :left_score, :right_score, :yellow_card, :red_card, :own_goal, :extra_time, :penalty)
    end
end
