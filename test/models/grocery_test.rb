require "test_helper"

class GroceryTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Grocery.column_names.include?('name')
  end

  test 'should be unique' do
    name = Faker::Lorem.word
    assert_difference('Grocery.count') do
      Grocery.create!(name: name)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      grocery = Grocery.create(name: name)
    }
  end

  test 'should titleize name before save' do
    words = Faker::Lorem.sentence(word_count: 3)
    grocery = Grocery.create!(name: words)
    assert_equal words.titleize, Grocery.last.name
  end
end
