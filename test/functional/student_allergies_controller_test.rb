require 'test_helper'

class StudentAllergiesControllerTest < ActionController::TestCase
  setup do
    @student_allergy = student_allergies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_allergies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_allergy" do
    assert_difference('StudentAllergy.count') do
      post :create, student_allergy: { allergy_id: @student_allergy.allergy_id, student_id: @student_allergy.student_id }
    end

    assert_redirected_to student_allergy_path(assigns(:student_allergy))
  end

  test "should show student_allergy" do
    get :show, id: @student_allergy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_allergy
    assert_response :success
  end

  test "should update student_allergy" do
    put :update, id: @student_allergy, student_allergy: { allergy_id: @student_allergy.allergy_id, student_id: @student_allergy.student_id }
    assert_redirected_to student_allergy_path(assigns(:student_allergy))
  end

  test "should destroy student_allergy" do
    assert_difference('StudentAllergy.count', -1) do
      delete :destroy, id: @student_allergy
    end

    assert_redirected_to student_allergies_path
  end
end
