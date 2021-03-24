# I tried to build #combination myself before figuring out that it already exists in Enumerable.
# This is dumb, yes. But I'm leaving this test in because I spent so much time on it
# and want to push something as a reminder

# require 'test_helper'
#
# class CalculateCaloriesTest < ActiveSupport::TestCase
#   test 'should return array' do
#     ids = [1, 2, 3, 4]
#     picks = 2
#     result = MealsWithAllSides.new(ids, picks).perform
#     assert result.is_a?(Array)
#   end
#
#   test 'should calculate final size of the returned array' do
#     ids = (1..10).to_a
#     picks = 2
#     result = MealsWithAllSides.new(ids, picks).final_size
#     assert_equal ids_ten_sides_two.size, result
#
#     picks = 3
#     result = MealsWithAllSides.new(ids, picks).final_size
#     assert_equal ids_ten_sides_three.size, result
#   end
#
#   test 'should calculate how many times a single element will appear' do
#     ids = (1..10).to_a
#     picks = 2
#     result = MealsWithAllSides.new(ids, picks).calculate_element_appearance
#     assert_equal result, ids.size - 1
#
#     ids2 = (1..50).to_a
#     picks2 = 2
#     result2 = MealsWithAllSides.new(ids2, picks2).calculate_element_appearance
#     assert_equal result2, ids2.size - 1
#
#     ids3 = (1..10).to_a
#     picks3 = 3
#     result3 = MealsWithAllSides.new(ids3, picks3).calculate_element_appearance
#     assert_equal result3, ids_ten_sides_three.flatten.count(ids3[0])
#   end
#
#   def ids_ten_sides_two
#     [[1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [1, 8], [1, 9], [1, 10],
#      [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [2, 8], [2, 9], [2, 10], [3, 4],
#      [3, 5], [3, 6], [3, 7], [3, 8], [3, 9], [3, 10], [4, 5], [4, 6], [4, 7],
#      [4, 8], [4, 9], [4, 10], [5, 6], [5, 7], [5, 8], [5, 9], [5, 10], [6, 7],
#      [6, 8], [6, 9], [6, 10], [7, 8], [7, 9], [7, 10], [8, 9], [8, 10], [9, 10]]
#   end
#
#   def ids_ten_sides_three
#     [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 2, 6], [1, 2, 7], [1, 2, 8], [1, 2, 9],
#      [1, 2, 10], [1, 3, 4], [1, 3, 5], [1, 3, 6], [1, 3, 7], [1, 3, 8], [1, 3, 9],
#      [1, 3, 10], [1, 4, 5], [1, 4, 6], [1, 4, 7], [1, 4, 8], [1, 4, 9], [1, 4, 10],
#      [1, 5, 6], [1, 5, 7], [1, 5, 8], [1, 5, 9], [1, 5, 10], [1, 6, 7], [1, 6, 8],
#      [1, 6, 9], [1, 6, 10], [1, 7, 8], [1, 7, 9], [1, 7, 10], [1, 8, 9], [1, 8, 10],
#      [1, 9, 10], [2, 3, 4], [2, 3, 5], [2, 3, 6], [2, 3, 7], [2, 3, 8], [2, 3, 9],
#      [2, 3, 10], [2, 4, 5], [2, 4, 6], [2, 4, 7], [2, 4, 8], [2, 4, 9], [2, 4, 10],
#      [2, 5, 6], [2, 5, 7], [2, 5, 8], [2, 5, 9], [2, 5, 10], [2, 6, 7], [2, 6, 8],
#      [2, 6, 9], [2, 6, 10], [2, 7, 8], [2, 7, 9], [2, 7, 10], [2, 8, 9], [2, 8, 10],
#      [2, 9, 10], [3, 4, 5], [3, 4, 6], [3, 4, 7], [3, 4, 8], [3, 4, 9], [3, 4, 10],
#      [3, 5, 6], [3, 5, 7], [3, 5, 8], [3, 5, 9], [3, 5, 10], [3, 6, 7], [3, 6, 8],
#      [3, 6, 9], [3, 6, 10], [3, 7, 8], [3, 7, 9], [3, 7, 10], [3, 8, 9], [3, 8, 10],
#      [3, 9, 10], [4, 5, 6], [4, 5, 7], [4, 5, 8], [4, 5, 9], [4, 5, 10], [4, 6, 7],
#      [4, 6, 8], [4, 6, 9], [4, 6, 10], [4, 7, 8], [4, 7, 9], [4, 7, 10], [4, 8, 9],
#      [4, 8, 10], [4, 9, 10], [5, 6, 7], [5, 6, 8], [5, 6, 9], [5, 6, 10], [5, 7, 8],
#      [5, 7, 9], [5, 7, 10], [5, 8, 9], [5, 8, 10], [5, 9, 10], [6, 7, 8], [6, 7, 9],
#      [6, 7, 10], [6, 8, 9], [6, 8, 10], [6, 9, 10], [7, 8, 9], [7, 8, 10], [7, 9, 10],
#      [8, 9, 10]]
#   end
# end
