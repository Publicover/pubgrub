require "test_helper"

class CondimentsControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < CondimentsControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get condiments_path
      assert_response :success
    end

    test 'should get single record' do
      get condiment_path(condiments(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_condiment_path
      assert_response :success
    end

    test 'should create' do
      word = Faker::Lorem.word
      assert_difference('Condiment.count') do
        post condiments_path, params: {
          condiment: {
            name: word,
            calories_per_gram: 4.5
          }
        }
      end
      assert_equal Condiment.last.name, word.titleize
      assert_redirected_to condiments_path
    end

    test 'should get edit' do
      get edit_condiment_path(condiments(:one))
      assert_response :success
    end

    test 'should update' do
      word = Faker::Lorem.word
      patch condiment_path(condiments(:one)), params: {
        condiment: {
          name: word
        }
      }
      assert_equal condiments(:one).reload.name, word.titleize
    end

    test 'should destroy' do
      assert_difference('Condiment.count', -1) do
        delete condiment_path(condiments(:one))
      end
    end
  end

  class AsMember < CondimentsControllerTest
    setup do
      login_as users(:dave)
    end
    
    test 'should not get index' do
      assert_raises(Pundit::NotAuthorizedError) {
        get condiments_path
      }
    end

    test 'should not get single record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get condiments_path(condiments(:one))
      }
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_condiment_path
      }
    end

    test 'should not create' do
      assert_raises(Pundit::NotAuthorizedError) {
        post condiments_path, params: {
          condiment: {
            name: 'Candy'
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_condiment_path(condiments(:one))
      }
    end

    test 'should not update' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch condiment_path(condiments(:one)), params: {
          condiment: {
            name: name
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete condiment_path(condiments(:one))
      }
    end
  end
end
