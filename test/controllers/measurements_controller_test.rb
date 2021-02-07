require "test_helper"

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:jim)
  end

  class AsAdmin < MeasurementsControllerTest
    test 'should get index' do
      get measurements_path
      assert_response :success
    end

    test 'should get single record' do
      get measurement_path(measurements(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_measurement_path
      assert_response :success
    end

    test 'should create' do
      word = Faker::Lorem.word
      assert_difference('Measurement.count') do
        post measurements_path, params: {
          measurement: {
            measure: word
          }
        }
      end
      assert_redirected_to measurements_path
    end

    test 'should get edit' do
      get edit_measurement_path(measurements(:one))
      assert_response :success
    end

    test 'should update' do
      word = Faker::Lorem.word
      patch measurement_path(measurements(:one)), params: {
        measurement: {
          measure: word
        }
      }
      assert_equal word.titleize, Measurement.last.measure
      assert_redirected_to measurement_path(measurements(:one))
    end

    test 'should destroy' do
      assert_difference('Measurement.count', -1) do
        delete measurement_path(measurements(:one))
      end
      assert_redirected_to measurements_path
    end
  end

  class AsMember < MeasurementsControllerTest
    setup do
      login_as(users(:dave))
    end

    test 'should not get index' do
      # assert_raises(Pundit::NotAuthorizedError) {}
      assert_raises(Pundit::NotAuthorizedError) {
        get measurements_path
      }
    end

    test 'should not get single record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get measurement_path(measurements(:one))
      }
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_measurement_path
      }
    end

    test 'should not create' do
      assert_raises(Pundit::NotAuthorizedError) {
        post measurements_path, params: {
          measurement: {
            measure: 'whatever'
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_measurement_path(measurements(:one))
      }
    end

    test 'should not update' do
      assert_raises(Pundit::NotAuthorizedError) {
        patch measurement_path(measurements(:one)), params: {
          measure: 'something'
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete measurement_path(measurements(:one))
      }
    end
  end
end
