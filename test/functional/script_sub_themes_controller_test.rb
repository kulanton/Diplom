require 'test_helper'

class ScriptSubThemesControllerTest < ActionController::TestCase
  setup do
    @script_sub_theme = script_sub_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:script_sub_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create script_sub_theme" do
    assert_difference('ScriptSubTheme.count') do
      post :create, :script_sub_theme => @script_sub_theme.attributes
    end

    assert_redirected_to script_sub_theme_path(assigns(:script_sub_theme))
  end

  test "should show script_sub_theme" do
    get :show, :id => @script_sub_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @script_sub_theme.to_param
    assert_response :success
  end

  test "should update script_sub_theme" do
    put :update, :id => @script_sub_theme.to_param, :script_sub_theme => @script_sub_theme.attributes
    assert_redirected_to script_sub_theme_path(assigns(:script_sub_theme))
  end

  test "should destroy script_sub_theme" do
    assert_difference('ScriptSubTheme.count', -1) do
      delete :destroy, :id => @script_sub_theme.to_param
    end

    assert_redirected_to script_sub_themes_path
  end
end
