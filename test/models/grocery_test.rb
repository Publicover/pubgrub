require "test_helper"

class GroceryTest < ActiveSupport::TestCase
  test 'should be unique' do
    name = Faker::Lorem.word
    assert_difference('Grocery.count') do
      Grocery.create!(name: name)
    end
    grocery = Grocery.create(name: name)
    assert_not grocery.save
    assert_not_nil grocery.errors[:line1]
  end

  test 'should titleize name before save' do
    words = Faker::Lorem.sentence(word_count: 3)
    grocery = Grocery.create!(name: words)
    assert_equal words.titleize, Grocery.last.name
  end
end
