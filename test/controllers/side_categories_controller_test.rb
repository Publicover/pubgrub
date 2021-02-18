require "test_helper"

class SideCategoriesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < SideCategoriesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get side_categories_path
      assert_response(:success)
    end

    test 'should get single record' do
      get side_category_path(side_categories(:starch))
      assert_response(:success)
    end

    test 'should get new' do
      get new_side_category_path
      assert_response(:success)
    end

    test 'should create side category' do
      name = Faker::Lorem.word
      assert_difference('SideCategory.count') do
        post side_categories_path, params: { side_category: {
            name: name
          }
        }
      end
      assert_redirected_to side_categories_path
    end

    test 'should get edit' do
      get edit_side_category_path(side_categories(:starch))
      assert_response(:success)
    end

    test 'should update and titleize cuisine' do
      name = Faker::Lorem.word
      patch side_category_path(side_categories(:starch)), params: {
        side_category: {
          name: name
        }
      }
      assert_equal name.titleize, side_categories(:starch).reload.name
      assert_redirected_to side_category_path(side_categories(:starch))
    end

    test 'should destroy cuisine' do
      assert_difference('SideCategory.count', -1) do
        delete side_category_path(side_categories(:starch))
      end
      assert_redirected_to side_categories_path
    end
  end

  class AsMember < SideCategoriesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get side_categories_path
      assert_response(:success)
    end

    test 'should get show' do
      get side_category_path(side_categories(:starch))
      assert_response(:success)
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_side_category_path
      }
    end

    test 'should not create' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        post side_categories_path, params: { side_category: {
            name: name
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_side_category_path(side_categories(:starch))
      }
    end

    test 'should not update' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch side_category_path(side_categories(:starch)), params: {
          side_category: {
            name: name
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete side_category_path(side_categories(:starch))
      }
    end
  end
end
