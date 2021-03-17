require "test_helper"

class StaplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:jim)
  end

  test 'should get index' do
    get staples_path
    assert_response :success
  end

  test 'should get single record' do
    get staple_path(staples(:one))
    assert_response :success
  end

  test 'should get new' do
    get new_staple_path
    assert_response :success
  end

  test 'should create' do
    assert_difference('Staple.count') do
      post staples_path, params: { staple: {
          grocery_id: groceries(:one).id,
          pic: fixture_file_upload('steak.jpg', 'image/jpg'),
          measurement_id: measurements(:whole).id,
          quantity: 1,
          user_id: users(:jim).id,
          status: :in_stock,
          grams_per_package: 100,
          calories_per_package: 510,
          calories_per_gram: 5.1
        }
      }
    end
    assert_equal 'steak.jpg', Staple.last.pic.filename.to_s
    assert_redirected_to staples_path
  end

  test 'should get edit' do
    get edit_staple_path(staples(:one))
    assert_response :success
  end

  test 'should update' do
    num = Faker::Number.number(digits: 3)
    patch staple_path(staples(:one)), params: { staple: {
        quantity: num
      }
    }
    assert_equal staples(:one).reload.quantity, num
    assert_redirected_to staple_path(staples(:one))
  end

  test 'should destroy' do
    assert_difference('Staple.count', -1) do
      delete staple_path(staples(:one))
    end
    assert_redirected_to staples_path
  end

  test 'should flip status from grocery list' do
    staple = staples(:one)
    assert staple.in_stock?
    get update_staple_status_staple_path(staple)
    assert staple.reload.out_of_stock?
    get update_staple_status_staple_path(staple)
    assert staple.reload.in_stock?
    assert_redirected_to ingredients_path
  end

  test 'should flip status from staple card' do
    staple = staples(:one)
    assert staple.in_stock?
    get update_staple_card_status_staple_path(staple)
    assert staple.reload.out_of_stock?
    get update_staple_card_status_staple_path(staple)
    assert staple.reload.in_stock?
    assert_redirected_to staples_path
  end
end
