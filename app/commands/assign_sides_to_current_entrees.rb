# frozen_string_literal: true

class AssignSidesToCurrentEntrees
  def perform
    Entree.current.each do |entree|
      entree.side_category_ids.each do |category_id|
        id = SideCategory.find(category_id).sides.sample.id
        entree.present_sides << id
        entree.save
      end
    end
  end
end
