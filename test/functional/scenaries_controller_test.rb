require 'test_helper'

class ScenariesControllerTest < ActionController::TestCase
  setup do
    @scenary = scenaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scenaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scenary" do
    assert_difference('Scenary.count') do
      post :create, scenary: @scenary.attributes
    end

    assert_redirected_to scenary_path(assigns(:scenary))
  end

  test "should show scenary" do
    get :show, id: @scenary.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scenary.to_param
    assert_response :success
  end

  test "should update scenary" do
    put :update, id: @scenary.to_param, scenary: @scenary.attributes
    assert_redirected_to scenary_path(assigns(:scenary))
  end

  test "should destroy scenary" do
    assert_difference('Scenary.count', -1) do
      delete :destroy, id: @scenary.to_param
    end

    assert_redirected_to scenaries_path
  end
end
