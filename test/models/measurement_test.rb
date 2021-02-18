require "test_helper"

class MeasurementTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Measurement.column_names.include?('measure')
  end

  test 'should titleize name' do
    words = Faker::Lorem.sentence(word_count: 3)
    Measurement.create(measure: words)
    assert_equal words.titleize, Measurement.last.measure
  end
end
