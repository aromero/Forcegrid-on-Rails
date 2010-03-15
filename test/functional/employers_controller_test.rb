require 'test_helper'

class EmployersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer" do
    assert_difference('Employer.count') do
      post :create, :employer => { }
    end

    assert_redirected_to employer_path(assigns(:employer))
  end

  test "should show employer" do
    get :show, :id => employers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => employers(:one).to_param
    assert_response :success
  end

  test "should update employer" do
    put :update, :id => employers(:one).to_param, :employer => { }
    assert_redirected_to employer_path(assigns(:employer))
  end

  test "should destroy employer" do
    assert_difference('Employer.count', -1) do
      delete :destroy, :id => employers(:one).to_param
    end

    assert_redirected_to employers_path
  end
end
