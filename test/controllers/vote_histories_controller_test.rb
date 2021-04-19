require 'test_helper'

class VoteHistoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @vote_history = vote_histories(:one)
    @user = users(:one)
  end

  test "should get index" do
    get vote_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_history_url
    assert_response :success
  end

  test "should create vote_history" do
    assert_difference('VoteHistory.count') do
      post vote_histories_url, params: { vote_history: { restaurant_id: @vote_history.restaurant_id, user_id: @vote_history.user_id, votetype: @vote_history.votetype } }
    end

    assert_redirected_to vote_history_url(VoteHistory.last)
  end

  test "should show vote_history" do
    sign_in @user
    get vote_history_url(@vote_history)
    assert_response :success
  end


end
