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
      if @story_post.save
        format.html { redirect_to root_path, notice: 'Story post was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'Story post was not created.' }
      end
    end
  end
end
