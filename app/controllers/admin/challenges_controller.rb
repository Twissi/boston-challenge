class Admin::ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :admin_user?

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = apply_scopes(Challenge).all.order( date: :desc)
    authorize @challenges
    @current_scopes = current_scopes
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    authorize @challenge
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
    authorize @challenge
  end

  # GET /challenges/1/edit
  def edit
    authorize @challenge
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  def admin_user?
    unless current_user.admin?
      flash[:alert] = "Ej Ben, das ist nur fuer Krissi."
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:date, :title, :text, :comments, :enabled, :approved, :answerPic, :answerText)
    end
end
