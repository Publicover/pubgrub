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
          name: 'Thing',
          pic: fixture_file_upload('steak.jpg', 'image/jpg'),
          measurement: 'Whole',
          quantity: 1,
          user_id: users(:jim).id,
          status: :in_stock
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
    name = Faker::Lorem.word
    patch staple_path(staples(:one)), params: { staple: {
        name: name
      }
    }
    assert_equal staples(:one).reload.name, name.titleize
    assert_redirected_to staple_path(staples(:one))
  end

  test 'should destroy' do
    assert_difference('Staple.count', -1) do
      delete staple_path(staples(:one))
    end
    assert_redirected_to staples_path
  end
end
