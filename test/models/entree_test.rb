require "test_helper"

class EntreeTest < ActiveSupport::TestCase
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
end
