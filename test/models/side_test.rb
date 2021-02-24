require "test_helper"

class SideTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Side.column_names.include?('name')
    assert Side.column_names.include?('status')
    assert Side.column_names.include?('user_id')
    assert Side.column_names.include?('side_category_id')
  end

  test 'should titleize name before save' do
    name = Faker::Lorem.sentence(word_count: 5)
    Side.create(name: name, user_id: users(:jim).id, side_category_id: side_categories(:starch).id)
    assert_equal Side.last.name, name.titleize
  end

  test 'should validate uniqueness' do
    name = Faker::Lorem.sentence(word_count: 5)
    assert_difference('Side.count') do
      Side.create(name: name, user_id: users(:jim).id, side_category_id: side_categories(:starch).id)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      Side.create(name: name, user_id: users(:jim).id, side_category_id: side_categories(:starch).id)
    }
  end

  test 'should know user' do
    assert_equal sides(:one).user_id, users(:jim).id
  end

  test 'should know side category' do
    assert_equal sides(:one).side_category_id, side_categories(:vegetable).id
  end

  test 'should know ingredients' do
    ingredient_count = Ingredient.where(
                                  ingredientable_id: sides(:one).id,
                                  ingredientable_type: 'Side'
    ).count
    refute_equal ingredient_count, 0
    assert_equal sides(:one).ingredients.count, ingredient_count
  end

  test 'should delegate side category name' do
    assert_equal sides(:one).side_category_name, side_categories(:vegetable).name
  end

  test 'can flip enum' do
    assert_not sides(:one).current?
    sides(:one).current!
    assert sides(:one).reload.current?
  end
end
