# frozen_string_literal: true

class SetCurrentGroceryList
  def set_current_list
    GroceryList.current.each(&:archived!)
    GroceryList.last.current!
  end
end
