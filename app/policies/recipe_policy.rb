# frozen_string_literal: true

class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    return true if user.admin?
    return true if record.user_id == user.id

    false
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  def permitted_attributes
    %i[name user_id recipeable_id recipeable_type body]
  end
end
