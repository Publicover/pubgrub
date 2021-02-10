# frozen_string_literal: true

class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.current
    end
  end

  def index?
    true
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    return true if user.admin?
    return true if record.user_id == user.id

    false
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def permitted_attributes
    [:name, :cuisine, :pic, :user_id, {
      ingredients_attributes: %i[id grocery measurement meal_id quantity _destroy]
    }]
  end
end
