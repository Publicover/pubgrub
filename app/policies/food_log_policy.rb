# frozen_string_literal: true

class FoodLogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    return true if user.admin?

    true
  end

  def show?
    return true if user.admin?
    return true if record.user_id == user.id

    false
  end

  def new?
    true
  end

  def create?
    new?
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
    [:user_id, :entree_calories, side_calories: []]
  end
end
