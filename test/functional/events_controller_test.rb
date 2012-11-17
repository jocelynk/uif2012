require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { bibles_distributed: @event.bibles_distributed, date: @event.date, end_time: @event.end_time, gospel_shared: @event.gospel_shared, location_id: @event.location_id, meals_server: @event.meals_server, program_id: @event.program_id, start_time: @event.start_time }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { bibles_distributed: @event.bibles_distributed, date: @event.date, end_time: @event.end_time, gospel_shared: @event.gospel_shared, location_id: @event.location_id, meals_server: @event.meals_server, program_id: @event.program_id, start_time: @event.start_time }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
