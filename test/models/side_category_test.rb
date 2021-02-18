require "test_helper"

class SideCategoryTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert SideCategory.column_names.include?('name')
  end

  test 'should titleize name before save' do
    name = Faker::Lorem.sentence(word_count: 5)
    SideCategory.create(name: name)
    assert_equal SideCategory.last.name, name.titleize
  end

  test 'should validate uniqueness' do
    new_name = Faker::Lorem.word
    assert_difference('SideCategory.count') do
      SideCategory.create(name: new_name)
    end
    assert_raises(ActiveRecord::RecordNotUnique) {
      SideCategory.create(name: new_name)
    }
  end
end
