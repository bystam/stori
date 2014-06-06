require 'test_helper'

class StoryThreadsControllerTest < ActionController::TestCase
  setup do
    @story_thread = story_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_thread" do
    assert_difference('StoryThread.count') do
      post :create, story_thread: { end: @story_thread.end, name: @story_thread.name, start: @story_thread.start }
    end

    assert_redirected_to story_thread_path(assigns(:story_thread))
  end

  test "should show story_thread" do
    get :show, id: @story_thread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story_thread
    assert_response :success
  end

  test "should update story_thread" do
    put :update, id: @story_thread, story_thread: { end: @story_thread.end, name: @story_thread.name, start: @story_thread.start }
    assert_redirected_to story_thread_path(assigns(:story_thread))
  end

  test "should destroy story_thread" do
    assert_difference('StoryThread.count', -1) do
      delete :destroy, id: @story_thread
    end

    assert_redirected_to story_threads_path
  end
end
