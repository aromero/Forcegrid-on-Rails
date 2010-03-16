require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create, :worker => { }
    end

    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should show worker" do
    get :show, :id => workers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workers(:one).to_param
    assert_response :success
  end

  test "should update worker" do
    put :update, :id => workers(:one).to_param, :worker => { }
    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete :destroy, :id => workers(:one).to_param
    end

    assert_redirected_to workers_path
  end
end
