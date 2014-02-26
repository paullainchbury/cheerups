require 'test_helper'

class CheerupsControllerTest < ActionController::TestCase
  setup do
    @cheerup = cheerups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheerups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheerup" do
    assert_difference('Cheerup.count') do
      post :create, cheerup: { content: @cheerup.content, user_id: @cheerup.user_id }
    end

    assert_redirected_to cheerup_path(assigns(:cheerup))
  end

  test "should show cheerup" do
    get :show, id: @cheerup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheerup
    assert_response :success
  end

  test "should update cheerup" do
    put :update, id: @cheerup, cheerup: { content: @cheerup.content, user_id: @cheerup.user_id }
    assert_redirected_to cheerup_path(assigns(:cheerup))
  end

  test "should destroy cheerup" do
    assert_difference('Cheerup.count', -1) do
      delete :destroy, id: @cheerup
    end

    assert_redirected_to cheerups_path
  end
end
