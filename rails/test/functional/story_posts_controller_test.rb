require 'test_helper'

class StoryPostsControllerTest < ActionController::TestCase
  setup do
    @story_post = story_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_post" do
    assert_difference('StoryPost.count') do
      post :create, story_post: { story_thread: @story_post.story_thread, text: @story_post.text }
    end

    assert_redirected_to story_post_path(assigns(:story_post))
  end

  test "should show story_post" do
    get :show, id: @story_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story_post
    assert_response :success
  end

  test "should update story_post" do
    put :update, id: @story_post, story_post: { story_thread: @story_post.story_thread, text: @story_post.text }
    assert_redirected_to story_post_path(assigns(:story_post))
  end

  test "should destroy story_post" do
    assert_difference('StoryPost.count', -1) do
      delete :destroy, id: @story_post
    end

    assert_redirected_to story_posts_path
  end
end
