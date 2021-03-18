require "test_helper"

class CondimentTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Condiment.column_names.include?('name')
    assert Condiment.column_names.include?('calories_per_gram')
  end

  test 'should be unique' do
    name = Faker::Lorem.word
    assert_difference('Condiment.count') do
      Condiment.create!(name: name)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      Condiment.create(name: name)
    }
  end

  test 'should titleize name on save' do
    word = Faker::Lorem.word
    Condiment.create!(name: word, calories_per_gram: 10.5)
    assert_equal Condiment.last.name, word.titleize
  end
end
