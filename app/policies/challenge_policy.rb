class ChallengePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(enabled: true).where(["date < ?", Time.zone.now.end_of_day])
      end
    end
  end

  def initialize(user, challenge)
    @user = user
    @challenge = challenge
  end

  def permitted_attributes
    if user.admin?
      [:date, :title, :text, :enabled]
    elsif user.ben?
      [:answerPic, :answerText]
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin?
    # should probalby be limited to scope with current challenges for ben
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
