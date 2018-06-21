class PrizesController < ApplicationController
  before_action :require_login_permission_and_admin, except: [:show]
  before_action :require_login_permission, only: [:show]
  before_action :set_prize, only: [:show, :edit, :update, :destroy]

  # GET /prizes
  # GET /prizes.json
  def index
    
    if params[:code].present? && params[:match].present?
      @prizes = Prize.where("code = ?","#{params[:code]}").where("match_id = ?","#{params[:match]}")
    else
      if params[:code].present?
        @prizes = Prize.where("code = ?","#{params[:code]}")
      else
        if params[:match].present?
          @prizes = Prize.where("match_id = ?","#{params[:match]}")
        else
          @prizes = Prize.all
        end
      end        
    end  
    
    if params[:assign?].present?
      if params[:assign?] == "Yes"
        @prizes = @prizes.select do |p|
          !p.match.nil?
        end
      else
        if params[:assign?] == "No"
          @prizes = @prizes.select do |p|
            p.match.nil?
          end
        end
      end
    end
    
    if params[:owner?].present?
      if params[:owner?] == "Yes"
        @prizes = @prizes.select do |p|
          !p.user.nil?
        end
      else
        if params[:owner?] == "No"
          @prizes = @prizes.select do |p|
            p.user.nil?
          end
        end
      end
    end
    
    if params[:sort].present?
      if params[:sort]=="price-asc"
        @prizes = @prizes.sort_by{|p| [p.price]}  
      else
        if params[:sort]=="price-desc"
          @prizes = @prizes.sort_by{|p| [-p.price]}          
        end  
      end
          
    end
      
          
  end

  # GET /prizes/1
  # GET /prizes/1.json
  def show
    respond_to do |format|
      if params[:modal].present?        
        format.html { render :show_modal, layout: false }
      else
        format.html { render :show }
      end
    end
  end

  # GET /prizes/new
  def new
    @prize = Prize.new
  end

  # GET /prizes/1/edit
  def edit
  end

  # POST /prizes
  # POST /prizes.json
  def create
    @prize = Prize.new(prize_params)

    respond_to do |format|
      if @prize.save
        format.html { redirect_to @prize, notice: 'Prize was successfully created.' }
        format.json { render :show, status: :created, location: @prize }
      else
        format.html { render :new }
        format.json { render json: @prize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prizes/1
  # PATCH/PUT /prizes/1.json
  def update
    respond_to do |format|
      if @prize.update(prize_params)
        format.html { redirect_to @prize, notice: 'Prize was successfully updated.' }
        format.json { render :show, status: :ok, location: @prize }
      else
        format.html { render :edit }
        format.json { render json: @prize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prizes/1
  # DELETE /prizes/1.json
  def destroy
    @prize.destroy
    respond_to do |format|
      format.html { redirect_to prizes_url, notice: 'Prize was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize
      @prize = Prize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prize_params
      params.require(:prize).permit(:name, :code, :price, :sponsor, :description, :match_id, :user_id, {images: []})
    end
end
