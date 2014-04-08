class FrontendChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def update
  end
end
