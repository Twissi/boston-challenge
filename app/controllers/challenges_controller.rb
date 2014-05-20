class ChallengesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_challenge, only: [:show, :edit, :update]
  has_scope :approved, :type => :boolean
  has_scope :not_approved, :type => :boolean

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = policy_scope( apply_scopes(Challenge).all ).order( date: :desc)
    authorize @challenges
    @current_scopes = current_scopes
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    authorize @challenge
    set_metatags(@challenge)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:date, :title, :text, :comments, :enabled, :approved, :answerPic, :answerText)
    end

    def set_metatags(challenge)
      @title = @challenge.date.to_s(:day_and_month) + ": " + @challenge.title.to_s
      @image = @challenge.answerPic
      @description = "# " + @challenge.text.to_s
    end
end
