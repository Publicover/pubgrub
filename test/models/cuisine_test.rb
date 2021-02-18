require "test_helper"

class CuisineTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Cuisine.column_names.include?('name')
  end

  test 'should titleize name before save' do
    name = Faker::Lorem.sentence(word_count: 5)
    Cuisine.create(name: name)
    assert_equal Cuisine.last.name, name.titleize
  end

  test 'should validate uniqueness' do
    new_name = Faker::Lorem.word
    assert_difference('Cuisine.count') do
      Cuisine.create(name: new_name)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      Cuisine.create(name: new_name)
    }
  end

  test 'should know entrees' do
    assert_not_nil cuisines(:american).entrees
    assert_equal cuisines(:american).entrees.count, Entree.where(cuisine_id: cuisines(:american).id).count
  end
end
