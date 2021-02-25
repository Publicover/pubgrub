require 'test_helper'

class AssignSidesToCurrentEntreesTest < ActionDispatch::IntegrationTest
  test 'should assign sides' do
    # make sure the category has more than one side
    assert_equal side_categories(:starch).sides.count, 3
    # make sure there's only one current entree for testing purposes
    Entree.current.each(&:archived!)
    assert_equal Entree.current.count, 0
    Entree.all.sample.update(side_category_ids: [side_categories(:starch).id, side_categories(:vegetable).id],
                             status: :current,
                             number_of_sides: 2)
    # run the command
    AssignSidesToCurrentEntrees.new.perform
    # check to make sure the side IDs exist and belong to the right categories
    entree = Entree.current.first
    assert_equal entree.sides.count, entree.reload.present_sides.size
    entree.reload.sides.each do |side|
      assert entree.reload.present_sides.include?(side.id)
    end
  end

  test 'should continue gracefully if there are no sides' do
    # make sure the category has more than one side
    assert_equal side_categories(:starch).sides.count, 3
    # make sure there's only one current entree for testing purposes
    Entree.current.each(&:archived!)
    assert_equal Entree.current.count, 0
    # no sides and no expectation of sides
    Entree.all.sample.update(side_category_ids: [],
                             status: :current,
                             number_of_sides: 0)
    # run the command
    AssignSidesToCurrentEntrees.new.perform
    # check to make sure the side IDs exist and belong to the right categories
    entree = Entree.current.first
    assert_equal entree.reload.sides.count, entree.reload.present_sides.size
    entree.reload.sides.each do |side|
      puts "----entree.present_sides #{entree.present_sides}----"
      assert entree.present_sides.include?(side.id)
    end
  end
end
