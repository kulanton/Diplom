require 'test_helper'

class RepositoryThemesControllerTest < ActionController::TestCase
  setup do
    @repository_theme = repository_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repository_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repository_theme" do
    assert_difference('RepositoryTheme.count') do
      post :create, :repository_theme => @repository_theme.attributes
    end

    assert_redirected_to repository_theme_path(assigns(:repository_theme))
  end

  test "should show repository_theme" do
    get :show, :id => @repository_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @repository_theme.to_param
    assert_response :success
  end

  test "should update repository_theme" do
    put :update, :id => @repository_theme.to_param, :repository_theme => @repository_theme.attributes
    assert_redirected_to repository_theme_path(assigns(:repository_theme))
  end

  test "should destroy repository_theme" do
    assert_difference('RepositoryTheme.count', -1) do
      delete :destroy, :id => @repository_theme.to_param
    end

    assert_redirected_to repository_themes_path
  end
end
