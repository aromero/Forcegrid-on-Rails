require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bid" do
    assert_difference('Bid.count') do
      post :create, :bid => { }
    end

    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should show bid" do
    get :show, :id => bids(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bids(:one).to_param
    assert_response :success
  end

  test "should update bid" do
    put :update, :id => bids(:one).to_param, :bid => { }
    assert_redirected_to bid_path(assigns(:bid))
  end

  test "should destroy bid" do
    assert_difference('Bid.count', -1) do
      delete :destroy, :id => bids(:one).to_param
    end

    assert_redirected_to bids_path
  end
end
