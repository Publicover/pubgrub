require "test_helper"

class SidesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < SidesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get sides_path
      assert_response :success
    end

    test 'should get single record' do
      get side_path(sides(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_side_path
      assert_response :success
    end

    test 'should create with pic and ingredients' do
      ingredient_count = Ingredient.count
      word = Faker::Lorem.word
      assert_difference('Side.count') do
        post sides_path, params: {
          side: {
            name: 'Jalapeno Poppers',
            side_category_id: side_categories(:starch).id,
            status: :archived,
            user_id: users(:jim).id,
            pic: fixture_file_upload('steak.jpg', 'image/jpg'),
            ingredients_attributes: [{
              grocery: word,
              quantity: 12,
              ingredientable_type: Side
            }]
          }
        }
      end
      assert_equal 'steak.jpg', Side.last.pic.filename.to_s
      assert_equal Ingredient.last.grocery, word
      assert_equal Ingredient.count, ingredient_count + 1
      assert_redirected_to sides_path
    end

    test 'should get edit' do
      get edit_side_path(sides(:one))
      assert_response :success
    end

    test 'should update' do
      word = Faker::Lorem.word
      patch side_path(sides(:one)), params: {
        side: {
          name: word
        }
      }
      assert_equal sides(:one).reload.name, word.titleize
      assert_redirected_to side_path(sides(:one))
    end

    test 'should destroy' do
      assert_difference('Side.count', -1) do
        delete side_path(sides(:one))
      end
      assert_redirected_to side_path(sides(:one))
    end
  end

  class AsMember < SidesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get sides_path
      assert_response :success
    end

    test 'should get single record' do
      get side_path(sides(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_side_path
      assert_response :success
    end

    test 'should create with pic and ingredients' do
      ingredient_count = Ingredient.count
      word = Faker::Lorem.word
      assert_difference('Side.count') do
        post sides_path, params: {
          side: {
            name: 'Jalapeno Poppers',
            side_category_id: side_categories(:starch).id,
            status: :archived,
            user_id: users(:jim).id,
            pic: fixture_file_upload('steak.jpg', 'image/jpg'),
            ingredients_attributes: [{
              grocery: word,
              quantity: 12,
              ingredientable_type: Side
            }]
          }
        }
      end
      assert_equal 'steak.jpg', Side.last.pic.filename.to_s
      assert_equal Ingredient.last.grocery, word
      assert_equal Ingredient.count, ingredient_count + 1
      assert_redirected_to sides_path
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_side_path(sides(:one))
      }
    end

    test 'should not update' do
      assert_raises(Pundit::NotAuthorizedError) {
        patch side_path(sides(:one)), params: {
          entree: {
            name: 'flunk'
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete side_path(sides(:one))
      }
    end
  end
end
