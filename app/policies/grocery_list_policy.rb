# frozen_string_literal: true

class GroceryListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def finished_shopping?
    true
  end
end
