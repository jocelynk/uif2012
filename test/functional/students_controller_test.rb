require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { barcode_number: @student.barcode_number, can_text: @student.can_text, cell_phone: @student.cell_phone, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, grade: @student.grade, household_id: @student.household_id, is_male: @student.is_male, last_name: @student.last_name, photo: @student.photo, status: @student.status }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    put :update, id: @student, student: { barcode_number: @student.barcode_number, can_text: @student.can_text, cell_phone: @student.cell_phone, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, grade: @student.grade, household_id: @student.household_id, is_male: @student.is_male, last_name: @student.last_name, photo: @student.photo, status: @student.status }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
