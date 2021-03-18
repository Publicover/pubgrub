require "test_helper"

class EntreesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < EntreesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get entrees_path
      assert_response :success
    end

    test 'should get single record' do
      get entree_path(entrees(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_entree_path
      assert_response :success
    end

    test 'should create with pic and ingredients' do
      ingredient_count = Ingredient.count
      assert_difference('Entree.count') do
        post entrees_path, params: {
          entree: {
            name: 'Jalapeno Poppers',
            number_of_sides: 0,
            side_category_ids: [side_categories(:starch).id],
            status: :archived,
            cuisine_id: cuisines(:american).id,
            user_id: users(:jim).id,
            pic: fixture_file_upload('steak.jpg', 'image/jpg'),
            ingredients_attributes: [{
              grocery_id: groceries(:one).id,
              quantity: 12,
              ingredientable_type: Entree
            }]
          }
        }
      end
      assert_equal 'steak.jpg', Entree.last.pic.filename.to_s
      assert_equal Ingredient.last.grocery, groceries(:one)
      assert_equal Ingredient.count, ingredient_count + 1
      assert_redirected_to entrees_path
    end

    test 'should get edit' do
      get edit_entree_path(entrees(:one))
      assert_response :success
    end

    test 'should update' do
      word = Faker::Lorem.word
      patch entree_path(entrees(:one)), params: {
        entree: {
          name: word
        }
      }
      assert_equal entrees(:one).reload.name, word.titleize
      assert_redirected_to entree_path(entrees(:one))
    end

    test 'should destroy' do
      assert_difference('Entree.count', -1) do
        delete entree_path(entrees(:one))
      end
      assert_redirected_to entrees_path
    end

    test 'should save calories_per_gram' do
      assert entrees(:one).calories_per_gram.nil?
      get finalize_calories_entree_path(entrees(:one))
      assert_not_nil entrees(:one).reload.calories_per_gram
    end
  end

  class AsMember < EntreesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get entrees_path
      assert_response :success
    end

    test 'should get single record' do
      get entree_path(entrees(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_entree_path
      assert_response :success
    end

    test 'should create with pic and ingredients' do
      ingredient_count = Ingredient.count
      assert_difference('Entree.count') do
        post entrees_path, params: {
          entree: {
            name: 'Jalapeno Poppers',
            number_of_sides: 0,
            side_category_ids: [side_categories(:starch).id],
            status: :archived,
            cuisine_id: cuisines(:american).id,
            user_id: users(:jim).id,
            pic: fixture_file_upload('steak.jpg', 'image/jpg'),
            ingredients_attributes: [{
              grocery_id: groceries(:one).id,
              quantity: 12,
              ingredientable_type: Entree
            }]
          }
        }
      end
      assert_equal 'steak.jpg', Entree.last.pic.filename.to_s
      assert_equal Ingredient.last.name, groceries(:one).name
      assert_equal Ingredient.count, ingredient_count + 1
      assert_redirected_to entrees_path
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_entree_path(entrees(:one))
      }
    end

    test 'should not update' do
      assert_raises(Pundit::NotAuthorizedError) {
        patch entree_path(entrees(:one)), params: {
          entree: {
            name: 'flunk'
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete entree_path(entrees(:one))
      }
    end
  end
end
