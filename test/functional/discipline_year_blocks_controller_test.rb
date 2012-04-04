require 'test_helper'

class DisciplineYearBlocksControllerTest < ActionController::TestCase
  setup do
    @discipline_year_block = discipline_year_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discipline_year_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discipline_year_block" do
    assert_difference('DisciplineYearBlock.count') do
      post :create, :discipline_year_block => @discipline_year_block.attributes
    end

    assert_redirected_to discipline_year_block_path(assigns(:discipline_year_block))
  end

  test "should show discipline_year_block" do
    get :show, :id => @discipline_year_block.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @discipline_year_block.to_param
    assert_response :success
  end

  test "should update discipline_year_block" do
    put :update, :id => @discipline_year_block.to_param, :discipline_year_block => @discipline_year_block.attributes
    assert_redirected_to discipline_year_block_path(assigns(:discipline_year_block))
  end

  test "should destroy discipline_year_block" do
    assert_difference('DisciplineYearBlock.count', -1) do
      delete :destroy, :id => @discipline_year_block.to_param
    end

    assert_redirected_to discipline_year_blocks_path
  end
end
