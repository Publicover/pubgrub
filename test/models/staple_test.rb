require "test_helper"

class StapleTest < ActiveSupport::TestCase
  test 'should know user' do
    assert_equal staples(:one).user, users(:jim)
  end

  test 'should validate unique name' do
    name = Faker::Lorem.sentence(word_count: 3)
    assert_difference('Staple.count') do
      Staple.create(name: name, user_id: users(:jim).id, measurement: 'Bag', quantity: 2)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      Staple.create(name: name, user_id: users(:jim).id, measurement: 'Bag', quantity: 2)
    }
  end

  test 'should titleize name before save' do
    name = Faker::Lorem.sentence(word_count: 3)
    Staple.create(name: name, user_id: users(:jim).id, measurement: 'Bag', quantity: 2)
    assert_equal Staple.last.name, name.titleize
  end
end
