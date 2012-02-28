require 'test_helper'

class SubThemesControllerTest < ActionController::TestCase
  setup do
    @sub_theme = sub_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_theme" do
    assert_difference('SubTheme.count') do
      post :create, sub_theme: @sub_theme.attributes
    end

    assert_redirected_to sub_theme_path(assigns(:sub_theme))
  end

  test "should show sub_theme" do
    get :show, id: @sub_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_theme.to_param
    assert_response :success
  end

  test "should update sub_theme" do
    put :update, id: @sub_theme.to_param, sub_theme: @sub_theme.attributes
    assert_redirected_to sub_theme_path(assigns(:sub_theme))
  end

  test "should destroy sub_theme" do
    assert_difference('SubTheme.count', -1) do
      delete :destroy, id: @sub_theme.to_param
    end

    assert_redirected_to sub_themes_path
  end
end
