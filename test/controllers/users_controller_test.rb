require 'test_helper'


class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @restaurant = restaurants(:one)
 end

  test 'should get user summary when signed in' do
    sign_in @user
    post user_session_url
    get users_show_path(@user)
    assert_response :success
  end

  test "should display corresponding restaurant when comment link clicked" do
   @comment = comments(:one)
    sign_in @comment.user
    get users_show_path(@comment.user)
    assert_response :success
    get restaurant_path(@comment.restaurant)
    assert_response :success
  end

 
 test "should display corresponding restaurant when vote link clicked" do
    @vote_history = vote_histories(:one) 
    sign_in @user
    get users_show_path(@user)
    assert_response :success
    get restaurant_path(@vote_history.restaurant)
    assert_response :success
  end

end
