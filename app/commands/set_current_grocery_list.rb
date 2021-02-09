class SetCurrentGroceryList
  def set_current_list
    GroceryList.current.each do |list|
      list.archived!
    end
    GroceryList.last.current!
  end
end
