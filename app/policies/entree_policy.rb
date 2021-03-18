# frozen_string_literal: true

class EntreePolicy < ApplicationPolicy
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
    [:name, :pic, :number_of_sides, :present_sides, :status, :user_id, :cuisine_id, {
      ingredients_attributes: %i[id grocery_id measurement quantity ingredientable_id ingredientable_type _destroy]
    }, { side_category_ids: [] }]
  end
end
