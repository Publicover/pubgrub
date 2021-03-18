# frozen_string_literal: true

class SidePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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

  def finalize_calories?
    edit?
  end

  def permitted_attributes
    [:name, :status, :pic, :user_id, :side_category_id, {
      ingredients_attributes: %i[id grocery_id measurement quantity ingredientable_id ingredientable_type _destroy]
    }]
  end
end
