# frozen_string_literal: true

class GroceryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true if user.admin?

    false
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
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def permitted_attributes
    [:name, :calories_per_gram, :calories_per_package, :grams_per_package]
  end
end
