class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def show?
    return true if user.admin?

    return true if record.id == user.id
  end

  def new?
    index?
  end

  def create?
    return true if user.admin?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    show?
  end

  def permitted_attributes
    [:email, :fname, :role, :password]
  end
end
