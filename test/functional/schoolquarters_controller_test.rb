require 'test_helper'

class SchoolquartersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schoolquarters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schoolquarter" do
    assert_difference('Schoolquarter.count') do
      post :create, :schoolquarter => { }
    end

    assert_redirected_to schoolquarter_path(assigns(:schoolquarter))
  end

  test "should show schoolquarter" do
    get :show, :id => schoolquarters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => schoolquarters(:one).to_param
    assert_response :success
  end

  test "should update schoolquarter" do
    put :update, :id => schoolquarters(:one).to_param, :schoolquarter => { }
    assert_redirected_to schoolquarter_path(assigns(:schoolquarter))
  end

  test "should destroy schoolquarter" do
    assert_difference('Schoolquarter.count', -1) do
      delete :destroy, :id => schoolquarters(:one).to_param
    end

    assert_redirected_to schoolquarters_path
  end
end
