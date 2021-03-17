require "test_helper"

class StapleTest < ActiveSupport::TestCase
  test 'should know user' do
    assert_equal staples(:one).user, users(:jim)
  end

  test 'should delegate name' do
    assert_equal staples(:one).name, groceries(:coffee).name
  end

  test 'should delegate calories_per_gram' do
    assert_equal staples(:three).calories_per_gram, groceries(:russian_bread).calories_per_gram
  end
end
