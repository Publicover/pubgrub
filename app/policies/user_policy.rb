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

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def permitted_attributes
    [:email, :fname, :role, :password]
  end
end
