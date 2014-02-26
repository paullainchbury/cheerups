require 'test_helper'

class CheerupVotesControllerTest < ActionController::TestCase
  setup do
    @cheerup_vote = cheerup_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheerup_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheerup_vote" do
    assert_difference('CheerupVote.count') do
      post :create, cheerup_vote: { cheerup_id: @cheerup_vote.cheerup_id, user_id: @cheerup_vote.user_id, value: @cheerup_vote.value }
    end

    assert_redirected_to cheerup_vote_path(assigns(:cheerup_vote))
  end

  test "should show cheerup_vote" do
    get :show, id: @cheerup_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheerup_vote
    assert_response :success
  end

  test "should update cheerup_vote" do
    put :update, id: @cheerup_vote, cheerup_vote: { cheerup_id: @cheerup_vote.cheerup_id, user_id: @cheerup_vote.user_id, value: @cheerup_vote.value }
    assert_redirected_to cheerup_vote_path(assigns(:cheerup_vote))
  end

  test "should destroy cheerup_vote" do
    assert_difference('CheerupVote.count', -1) do
      delete :destroy, id: @cheerup_vote
    end

    assert_redirected_to cheerup_votes_path
  end
end
