require 'test_helper'

class SectionEventsControllerTest < ActionController::TestCase
  setup do
    @section_event = section_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_event" do
    assert_difference('SectionEvent.count') do
      post :create, section_event: { event_id: @section_event.event_id, section_id: @section_event.section_id }
    end

    assert_redirected_to section_event_path(assigns(:section_event))
  end

  test "should show section_event" do
    get :show, id: @section_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_event
    assert_response :success
  end

  test "should update section_event" do
    put :update, id: @section_event, section_event: { event_id: @section_event.event_id, section_id: @section_event.section_id }
    assert_redirected_to section_event_path(assigns(:section_event))
  end

  test "should destroy section_event" do
    assert_difference('SectionEvent.count', -1) do
      delete :destroy, id: @section_event
    end

    assert_redirected_to section_events_path
  end
end
