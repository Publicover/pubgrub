# require "test_helper"
#
# class MealsControllerTest < ActionDispatch::IntegrationTest
#   class AsAdmin < MealsControllerTest
#     setup do
#       login_as users(:jim)
#     end
#
#     test 'should get index' do
#       get meals_path
#       assert_response :success
#     end
#
#     test 'should get show' do
#       get meal_path(meals(:steak))
#       assert_response :success
#     end
#
#     test 'should get new' do
#       get new_meal_path
#       assert_response :success
#     end
#
#     test 'should create' do
#       assert_difference('Meal.count') do
#         post meals_path, params: { meal: {
#             name: 'Steak',
#             cuisine: 'American',
#             pic: fixture_file_upload('steak.jpg', 'image/jpg'),
#             user_id: users(:jim).id
#           }
#         }
#       end
#       assert_equal 'steak.jpg', Meal.last.pic.filename.to_s
#       assert_redirected_to meals_path
#     end
#
#     test 'should get edit' do
#       get edit_meal_path(meals(:steak))
#       assert_response :success
#     end
#
#     test 'should update' do
#       word = Faker::Lorem.word
#       patch meal_path(meals(:steak)), params: {
#         meal: {
#           name: word
#         }
#       }
#       assert_equal word, meals(:steak).reload.name
#       assert_redirected_to meal_path(meals(:steak))
#     end
#
#     test 'should destroy' do
#       assert_difference('Meal.count', -1) do
#         delete meal_path(meals(:steak))
#       end
#       assert_redirected_to meals_path
#     end
#   end
#
#   class AsMember < MealsControllerTest
#     setup do
#       login_as users(:dave)
#     end
#
#     test 'should get index' do
#       get meals_path
#       assert_response :success
#     end
#
#     test 'should get single record' do
#       get meal_path(meals(:steak))
#       assert_response :success
#     end
#
#     test 'should get new' do
#       get new_meal_path
#       assert_response :success
#     end
#
#     test 'should create' do
#       assert_difference('Meal.count') do
#         post meals_path, params: { meal: {
#             name: 'Steak',
#             cuisine: 'American',
#             pic: fixture_file_upload('steak.jpg', 'image/jpg'),
#             user_id: users(:jim).id
#           }
#         }
#       end
#       assert_equal 'steak.jpg', Meal.last.pic.filename.to_s
#       assert_redirected_to meals_path
#     end
#
#     test 'should create with ingredients' do
#       ingredient_count = Ingredient.count
#       nested_ingredients = {
#                               grocery: 'Milk',
#                               measurement: 'Cup',
#                               quantity: 2.5
#                             }, {
#                               grocery: 'Ice',
#                               measurement: 'Cup',
#                               quantity: 5.00
#                             }
#
#       assert_difference('Meal.count') do
#         post meals_path, params: {
#           meal: {
#             name: 'Ice Cream',
#             cuisine: 'American',
#             user_id: users(:jim).id,
#             ingredients_attributes: [
#               nested_ingredients
#             ]
#           }
#         }
#       end
#       assert_equal Meal.last.ingredients.count, Ingredient.count - ingredient_count
#       assert_equal Ingredient.count, ingredient_count + nested_ingredients.size
#     end
#
#     test 'should get own edit' do
#       get edit_meal_path(meals(:mac_n_cheese))
#       assert_response :success
#     end
#
#     test 'should not get edit for another record' do
#       assert_raises(Pundit::NotAuthorizedError) {
#         get edit_meal_path(meals(:steak))
#       }
#     end
#
#     test 'should update own record' do
#       word = Faker::Lorem.word
#       patch meal_path(meals(:mac_n_cheese)), params: {
#         meal: {
#           name: word
#         }
#       }
#       assert_equal word, meals(:mac_n_cheese).reload.name
#       assert_redirected_to meal_path(meals(:mac_n_cheese))
#     end
#
#     test 'should not update another record' do
#       word = Faker::Lorem.word
#       assert_raises(Pundit::NotAuthorizedError) {
#         patch meal_path(meals(:steak)), params: {
#           meal: {
#             name: word
#           }
#         }
#       }
#     end
#
#     test 'should destroy own record' do
#       assert_difference('Meal.count', -1) do
#         delete meal_path(meals(:mac_n_cheese))
#       end
#       assert_redirected_to meals_path
#     end
#
#     test 'should not destroy another record' do
#       assert_raises(Pundit::NotAuthorizedError) {
#         delete meal_path(meals(:steak))
#       }
#     end
#   end
# end
