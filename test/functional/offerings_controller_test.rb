require 'test_helper'

class OfferingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offering" do
    assert_difference('Offering.count') do
      post :create, :offering => { }
    end

    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should show offering" do
    get :show, :id => offerings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => offerings(:one).to_param
    assert_response :success
  end

  test "should update offering" do
    put :update, :id => offerings(:one).to_param, :offering => { }
    assert_redirected_to offering_path(assigns(:offering))
  end

  test "should destroy offering" do
    assert_difference('Offering.count', -1) do
      delete :destroy, :id => offerings(:one).to_param
    end

    assert_redirected_to offerings_path
  end
end
