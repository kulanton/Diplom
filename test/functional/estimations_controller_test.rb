require 'test_helper'

class EstimationsControllerTest < ActionController::TestCase
  setup do
    @estimation = estimations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estimations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estimation" do
    assert_difference('Estimation.count') do
      post :create, estimation: @estimation.attributes
    end

    assert_redirected_to estimation_path(assigns(:estimation))
  end

  test "should show estimation" do
    get :show, id: @estimation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estimation.to_param
    assert_response :success
  end

  test "should update estimation" do
    put :update, id: @estimation.to_param, estimation: @estimation.attributes
    assert_redirected_to estimation_path(assigns(:estimation))
  end

  test "should destroy estimation" do
    assert_difference('Estimation.count', -1) do
      delete :destroy, id: @estimation.to_param
    end

    assert_redirected_to estimations_path
  end
end
