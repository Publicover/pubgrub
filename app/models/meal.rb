class Meal < ApplicationRecord
  belongs_to :entree

  def name
    name = String.new
    sides = String.new
    name << "#{Entree.find(entree_id).name} with "
    side_ids.each do |id|
      sides << "#{Side.find(id).name} & "
    end
    name << sides[0..-4]
  end

  def sides
    Side.find(side_ids)
  end
end
