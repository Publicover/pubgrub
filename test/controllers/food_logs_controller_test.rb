require "test_helper"

class FoodLogsControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < FoodLogsControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get food_logs_path
      assert_response :success
    end

    test 'should get single record' do
      get food_log_path(food_logs(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_food_log_path
      assert_response :success
    end

    test 'should create' do
      assert_difference('FoodLog.count') do
        post food_logs_path, params: {
          food_log: {
            user_id: users(:jim).id,
            entree_calories: 500,
            side_calories: [10, 11]
          }
        }
      end
      assert_redirected_to food_logs_path
    end

    test 'should get edit' do
      get edit_food_log_path(food_logs(:one))
      assert_response :success
    end

    test 'should update' do
      patch food_log_path(food_logs(:one)), params: {
        food_log: {
          entree_calories: 999
        }
      }
      assert_equal food_logs(:one).reload.entree_calories, 999
      assert_redirected_to food_logs_path
    end

    test 'should destroy' do
      assert_difference('FoodLog.count', -1) do
        delete food_log_path(food_logs(:one))
      end
    end
  end

  class AsMember < FoodLogsControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get food_logs_path
      assert_response :success
    end

    test 'should get single record' do
      get food_log_path(food_logs(:three))
      assert_response :success
    end

    test 'should get new' do
      get new_food_log_path
      assert_response :success
    end

    test 'should create' do
      assert_difference('FoodLog.count') do
        post food_logs_path, params: {
          food_log: {
            user_id: users(:jim).id,
            entree_calories: 500,
            side_calories: [10, 11]
          }
        }
      end
      assert_redirected_to food_logs_path
    end

    test 'should get edit' do
      get edit_food_log_path(food_logs(:three))
      assert_response :success
    end

    test 'should update' do
      patch food_log_path(food_logs(:three)), params: {
        food_log: {
          entree_calories: 999
        }
      }
      assert_equal food_logs(:three).reload.entree_calories, 999
      assert_redirected_to food_logs_path
    end

    test 'should destroy' do
      assert_difference('FoodLog.count', -1) do
        delete food_log_path(food_logs(:three))
      end
    end
  end
end
