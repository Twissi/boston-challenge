class ChallengePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(enabled: true).where(["date < ?", Time.zone.now.end_of_day])
    end
  end

  def initialize(user, challenge)
    @user = user
    @challenge = challenge
  end

  def permitted_attributes
    if user.admin?
      [:date, :title, :text, :enabled, :approved]
    elsif user.ben?
      [:answerPic, :answerText]
    end
  end

  def index?
    true # everybody
  end

  def show?
    true # everybody
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.ben? || user.admin?)
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
