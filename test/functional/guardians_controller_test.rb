require 'test_helper'

class GuardiansControllerTest < ActionController::TestCase
  setup do
    @guardian = guardians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guardians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guardian" do
    assert_difference('Guardian.count') do
      post :create, guardian: { active: @guardian.active, can_text: @guardian.can_text, cell_phone: @guardian.cell_phone, email: @guardian.email, first_name: @guardian.first_name, guardian_type: @guardian.guardian_type, household_id: @guardian.household_id, last_name: @guardian.last_name }
    end

    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should show guardian" do
    get :show, id: @guardian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guardian
    assert_response :success
  end

  test "should update guardian" do
    put :update, id: @guardian, guardian: { active: @guardian.active, can_text: @guardian.can_text, cell_phone: @guardian.cell_phone, email: @guardian.email, first_name: @guardian.first_name, guardian_type: @guardian.guardian_type, household_id: @guardian.household_id, last_name: @guardian.last_name }
    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should destroy guardian" do
    assert_difference('Guardian.count', -1) do
      delete :destroy, id: @guardian
    end

    assert_redirected_to guardians_path
  end
end
