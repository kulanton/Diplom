require 'test_helper'

class ScriptThemesControllerTest < ActionController::TestCase
  setup do
    @script_theme = script_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:script_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create script_theme" do
    assert_difference('ScriptTheme.count') do
      post :create, :script_theme => @script_theme.attributes
    end

    assert_redirected_to script_theme_path(assigns(:script_theme))
  end

  test "should show script_theme" do
    get :show, :id => @script_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @script_theme.to_param
    assert_response :success
  end

  test "should update script_theme" do
    put :update, :id => @script_theme.to_param, :script_theme => @script_theme.attributes
    assert_redirected_to script_theme_path(assigns(:script_theme))
  end

  test "should destroy script_theme" do
    assert_difference('ScriptTheme.count', -1) do
      delete :destroy, :id => @script_theme.to_param
    end

    assert_redirected_to script_themes_path
  end
end
