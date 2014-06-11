class StoryPostsController < ApplicationController

  # GET /story_posts/new
  # GET /story_posts/new.json
  def new
    @story_post = StoryPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story_post }
    end
  end

  # POST /story_posts
  # POST /story_posts.json
  def create
    @story_post = StoryPost.new(params[:story_post])
    @story_post.text.strip!
    @story_post.story_thread = StoryThreadsController.current_thread

    respond_to do |format|
      if correct_parent?(@story_post)
        if @story_post.save
          format.html { redirect_to root_path, notice: 'Story post was successfully created.' }
        else
          format.html { redirect_to root_path, notice: 'Error when trying to save post.' }
        end
      else
        format.html { redirect_to root_path, notice: 'Somebody else posted before you.' }
      end
    end
  end

  def correct_parent? story_post
    current_parent_id = StoryThreadsController.current_thread.story_posts.last.id
    given_parent_id = story_post.parent_id.to_i
    return current_parent_id == given_parent_id
  end
end
