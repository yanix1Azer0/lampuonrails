require 'test_helper'

class AktuatorsControllerTest < ActionController::TestCase
  setup do
    @aktuator = aktuators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aktuators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aktuator" do
    assert_difference('Aktuator.count') do
      post :create, aktuator: { deskripsi: @aktuator.deskripsi, jenis: @aktuator.jenis, nama: @aktuator.nama, watt: @aktuator.watt }
    end

    assert_redirected_to aktuator_path(assigns(:aktuator))
  end

  test "should show aktuator" do
    get :show, id: @aktuator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aktuator
    assert_response :success
  end

  test "should update aktuator" do
    patch :update, id: @aktuator, aktuator: { deskripsi: @aktuator.deskripsi, jenis: @aktuator.jenis, nama: @aktuator.nama, watt: @aktuator.watt }
    assert_redirected_to aktuator_path(assigns(:aktuator))
  end

  test "should destroy aktuator" do
    assert_difference('Aktuator.count', -1) do
      delete :destroy, id: @aktuator
    end

    assert_redirected_to aktuators_path
  end
end
