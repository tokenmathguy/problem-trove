require 'test_helper'

class EffectivenessesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:effectivenesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create effectiveness" do
    assert_difference('Effectiveness.count') do
      post :create, :effectiveness => { }
    end

    assert_redirected_to effectiveness_path(assigns(:effectiveness))
  end

  test "should show effectiveness" do
    get :show, :id => effectivenesses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => effectivenesses(:one).to_param
    assert_response :success
  end

  test "should update effectiveness" do
    put :update, :id => effectivenesses(:one).to_param, :effectiveness => { }
    assert_redirected_to effectiveness_path(assigns(:effectiveness))
  end

  test "should destroy effectiveness" do
    assert_difference('Effectiveness.count', -1) do
      delete :destroy, :id => effectivenesses(:one).to_param
    end

    assert_redirected_to effectivenesses_path
  end
end
