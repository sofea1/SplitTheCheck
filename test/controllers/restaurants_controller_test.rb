require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { address: @restaurant.address, city: @restaurant.city, name: @restaurant.name, state: @restaurant.state, zip: @restaurant.zip } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { address: @restaurant.address, city: @restaurant.city, name: @restaurant.name, state: @restaurant.state, zip: @restaurant.zip } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end

  test "should search restaurant by name" do
    get restaurants_url, params: { name: "Lorem" }
    assert_response :success
  end

  test "should search restaurant by city" do
    get restaurants_url, params: { city: "Hulst" }
    assert_response :success
  end

  test "should search restaurant by state" do
    get restaurants_url, params: { state: "AL" }
    assert_response :success
  end

  test "should search restaurant by zip" do
    get restaurants_url, params: { zip: "73504" }
    assert_response :success
  end

  test "should search restaurant by name and city" do
    get restaurants_url, params: { name: "In", city: "Katihar" }
    assert_response :success
  end

  test "should search restaurant by name and state" do
    get restaurants_url, params: { name: "In", state: "CA" }
    assert_response :success
  end

  test "should search restaurant by name and zip" do
    get restaurants_url, params: { name: "In", zip: "39773" }
    assert_response :success
  end

  test "should search restaurant by city and state" do
    get restaurants_url, params: { city: "New Orleans", state: "LA" }
    assert_response :success
  end

  test "should search restaurant by state and zip" do
    get restaurants_url, params: { state: "New Orleans", zip: "6144" }
    assert_response :success
  end

  test "should search restaurant by name city state zip" do
    get restaurants_url, params: { name: "Ante Maecenas", city: "New Orleans", state: "LA", zip: "6144" }
    assert_response :success
  end

  test "should search restaurant by name city state zip in fixture one" do
    get restaurants_url, params: { name: "My Restaurant", city: "My City", state: "CA", zip: "10001" }
    assert_response :success
  end

  test "should increment restaurant split vote" do
    post restaurants_split_url(@restaurant)
    assert_equal @restaurant.reload.split, 18
    post restaurants_split_url(@restaurant)
    assert_equal @restaurant.reload.split, 19
  end

  test "should increment restaurant nosplit vote" do
    post restaurants_nosplit_url(@restaurant)
    assert_equal @restaurant.reload.nosplit, 2
    post restaurants_nosplit_url(@restaurant)
    assert_equal @restaurant.reload.nosplit, 3
  end


end
