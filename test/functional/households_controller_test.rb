require 'test_helper'

class HouseholdsControllerTest < ActionController::TestCase
  setup do
    @household = households(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:households)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create household" do
    assert_difference('Household.count') do
      post :create, household: { active: @household.active, church: @household.church, city: @household.city, insurance_company: @household.insurance_company, insurance_number: @household.insurance_number, lat: @household.lat, lon: @household.lon, name: @household.name, street2: @household.street2, street: @household.street, zip: @household.zip }
    end

    assert_redirected_to household_path(assigns(:household))
  end

  test "should show household" do
    get :show, id: @household
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @household
    assert_response :success
  end

  test "should update household" do
    put :update, id: @household, household: { active: @household.active, church: @household.church, city: @household.city, insurance_company: @household.insurance_company, insurance_number: @household.insurance_number, lat: @household.lat, lon: @household.lon, name: @household.name, street2: @household.street2, street: @household.street, zip: @household.zip }
    assert_redirected_to household_path(assigns(:household))
  end

  test "should destroy household" do
    assert_difference('Household.count', -1) do
      delete :destroy, id: @household
    end

    assert_redirected_to households_path
  end
end
