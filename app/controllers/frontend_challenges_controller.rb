class FrontendChallengesController < ApplicationController
  before_action :set_challenge, only: [:update]

  def index
    @challenges = Challenge.all
  end

  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to frontend_challenges_path, notice: 'Challenge answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: :index }
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
      params.require( :challenge ).permit( :answerPic, :answerText )
    end
end
