require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  setup do
    @program = programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post :create, program: { active: @program.active, active: @program.active, department_id: @program.department_id, description: @program.description, max_capacity: @program.max_capacity, max_grade: @program.max_grade, min_grade: @program.min_grade, name: @program.name }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  test "should show program" do
    get :show, id: @program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    put :update, id: @program, program: { active: @program.active, active: @program.active, department_id: @program.department_id, description: @program.description, max_capacity: @program.max_capacity, max_grade: @program.max_grade, min_grade: @program.min_grade, name: @program.name }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    assert_difference('Program.count', -1) do
      delete :destroy, id: @program
    end

    assert_redirected_to programs_path
  end
end
