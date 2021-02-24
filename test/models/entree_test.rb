require "test_helper"

class EntreeTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Entree.column_names.include?('name')
    assert Entree.column_names.include?('number_of_sides')
    assert Entree.column_names.include?('present_sides')
    assert Entree.column_names.include?('side_category_ids')
    assert Entree.column_names.include?('status')
    assert Entree.column_names.include?('cuisine_id')
    assert Entree.column_names.include?('user_id')
  end

  test 'should titleize name before save' do
    name = Faker::Lorem.sentence(word_count: 5)
    Entree.create(name: name, number_of_sides: 0, side_category_ids: [],
                  cuisine_id: cuisines(:american).id, user_id: users(:jim).id)
    assert_equal Entree.last.name, name.titleize
  end

  test 'should validate uniqueness' do
    name = Faker::Lorem.sentence(word_count: 5)
    assert_difference('Entree.count') do
      Entree.create(name: name, number_of_sides: 0, side_category_ids: [],
                    cuisine_id: cuisines(:american).id, user_id: users(:jim).id)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      Entree.create(name: name, number_of_sides: 0, side_category_ids: [],
                    cuisine_id: cuisines(:american).id, user_id: users(:jim).id)
    }
  end

  test 'should validate number_of_sides' do
    entree = Entree.create(name: name, side_category_ids: [],
                    cuisine_id: cuisines(:american).id, user_id: users(:jim).id)
    assert_not entree.save
    assert_not_nil entree.errors[:line1]
  end

  test 'should know user' do
    assert_equal entrees(:one).user_id, users(:jim).id
  end

  test 'should know cuisine' do
    assert_equal entrees(:one).cuisine_id, cuisines(:american).id
  end

  test 'should know ingredients' do
    ingredient_count = Ingredient.where(
                                    ingredientable_id: entrees(:one).id,
                                    ingredientable_type: 'Entree')
                                  .count
    refute_equal ingredient_count, 0
    assert_equal entrees(:one).ingredients.count, ingredient_count
  end

  test 'should collect by enum' do
    assert_equal Entree.current.count, Entree.where(status: :current).count
  end

  test 'should clear present sides' do
    # make all entrees current
    Entree.all.each { |entree| entree.update(status: :current)}
    # give all of them something in present_sides
    Entree.all.each { |entree| entree.update(present_sides: [1, 2, 3, 4])}
    # make sure it worked (since they all start blank)
    assert_not_nil Entree.where('present_sides IS NULL OR present_sides = ?', '{}').count
    assert_equal Entree.current.count, Entree.where.not('present_sides IS NULL OR present_sides = ?', '{}').count
    # clear present_sides in all current entrees
    Entree.clear_present_sides
    # assert that all entrees have clear present_sides
    assert_equal Entree.count, Entree.where('present_sides IS NULL OR present_sides = ?', '{}').count
  end

  test 'should associate present sides' do
    entree = entrees(:one)
    entree.present_sides = [sides(:one).id, sides(:two).id]
    assert_equal entree.sides.count, 2
  end

  test 'should assign sides' do
    entree = entrees(:one)
    entree.update(side_category_ids: [sides(:one).side_category_id, sides(:two).side_category_id])
    entree.assign_new_sides
    refute_equal entree.reload.present_sides, []
    assert_equal entree.reload.number_of_sides, entree.reload.sides.count
    entree.present_sides.each_with_index do |side_id, index|
      side = Side.find(side_id)
      assert_equal side.reload.side_category_id, entree.reload.side_category_ids[index]
    end
  end
end
