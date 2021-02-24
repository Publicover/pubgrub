require 'test_helper'

class AssignSidesToCurrentEntreesTest < ActionDispatch::IntegrationTest
  test 'should assign sides' do
    # make sure the category has more than one side
    assert side_categories(:starch).sides.count == 3
    # make sure there's only one current entree for testing purposes
    Entree.current.each(&:archived!)
    assert_equal Entree.current.count, 0
    Entree.all.sample.update(side_category_ids: [side_categories(:starch).id, side_categories(:vegetable).id],
                         status: :current)
    # run the command
    AssignSidesToCurrentEntrees.new.perform
    # check to make sure the side IDs exist and belong to the right categories
    entree = Entree.current.first
    assert_equal entree.sides.count, entree.present_sides.size
    entree.sides.each do |side|
      assert entree.present_sides.include?(side.id)
    end
  end
end
