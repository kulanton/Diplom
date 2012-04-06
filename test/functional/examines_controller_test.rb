require 'test_helper'

class ExaminesControllerTest < ActionController::TestCase
  setup do
    @examine = examines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:examines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create examine" do
    assert_difference('Examine.count') do
      post :create, :examine => @examine.attributes
    end

    assert_redirected_to examine_path(assigns(:examine))
  end

  test "should show examine" do
    get :show, :id => @examine.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @examine.to_param
    assert_response :success
  end

  test "should update examine" do
    put :update, :id => @examine.to_param, :examine => @examine.attributes
    assert_redirected_to examine_path(assigns(:examine))
  end

  test "should destroy examine" do
    assert_difference('Examine.count', -1) do
      delete :destroy, :id => @examine.to_param
    end

    assert_redirected_to examines_path
  end
end
