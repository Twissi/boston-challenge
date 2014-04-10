class ChallengePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(enabled: true).where(["date > ?", Time.zone.now-1.day])
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
    if user.admin?
      return true
    elsif user.ben?
      @challenge.date >= Time.zone.now
    else
      puts 'boo'
      false
    end
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end