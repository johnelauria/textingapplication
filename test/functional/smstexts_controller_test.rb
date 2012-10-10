require 'test_helper'

class SmstextsControllerTest < ActionController::TestCase
  setup do
    @smstext = smstexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smstexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smstext" do
    assert_difference('Smstext.count') do
      post :create, smstext: { recipient: @smstext.recipient, smsmessage: @smstext.smsmessage }
    end

    assert_redirected_to smstext_path(assigns(:smstext))
  end

  test "should show smstext" do
    get :show, id: @smstext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smstext
    assert_response :success
  end

  test "should update smstext" do
    put :update, id: @smstext, smstext: { recipient: @smstext.recipient, smsmessage: @smstext.smsmessage }
    assert_redirected_to smstext_path(assigns(:smstext))
  end

  test "should destroy smstext" do
    assert_difference('Smstext.count', -1) do
      delete :destroy, id: @smstext
    end

    assert_redirected_to smstexts_path
  end
end
