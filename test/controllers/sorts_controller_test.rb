require 'test_helper'

class SortsControllerTest < ActionController::TestCase
  setup do
    @sort = sorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sort" do
    assert_difference('Sort.count') do
      post :create, sort: { input: @sort.input, name: @sort.name, runtime: @sort.runtime }
    end

    assert_redirected_to sort_path(assigns(:sort))
  end

  test "should show sort" do
    get :show, id: @sort
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sort
    assert_response :success
  end

  test "should update sort" do
    patch :update, id: @sort, sort: { input: @sort.input, name: @sort.name, runtime: @sort.runtime }
    assert_redirected_to sort_path(assigns(:sort))
  end

  test "should destroy sort" do
    assert_difference('Sort.count', -1) do
      delete :destroy, id: @sort
    end

    assert_redirected_to sorts_path
  end
end
