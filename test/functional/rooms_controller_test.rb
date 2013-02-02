require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, room: { created_at: @room.created_at, del_flg: @room.del_flg, deleted_at: @room.deleted_at, max_head_count: @room.max_head_count, name: @room.name, updated_at: @room.updated_at, version: @room.version }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  test "should show room" do
    get :show, id: @room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room
    assert_response :success
  end

  test "should update room" do
    put :update, id: @room, room: { created_at: @room.created_at, del_flg: @room.del_flg, deleted_at: @room.deleted_at, max_head_count: @room.max_head_count, name: @room.name, updated_at: @room.updated_at, version: @room.version }
    assert_redirected_to room_path(assigns(:room))
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end

    assert_redirected_to rooms_path
  end
end
