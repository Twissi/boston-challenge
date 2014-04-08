class PostPolicy < ApplicationPolicy
  def permitted_attributes
    if user.admin?
      [:date, :title, :text, :enabled]
    elsif user.ben?
      [:answerPic, :answerText]
    end
  end

  def index?
    user.admin? || user.ben?
  end

  def show?
    user.admin? || user.ben?
    # should probalby be limited to scope with current challenges for ben
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end