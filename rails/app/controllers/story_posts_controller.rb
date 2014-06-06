class StoryPostsController < ApplicationController
  # GET /story_posts
  # GET /story_posts.json
  def index
    @story_posts = StoryPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @story_posts }
    end
  end

  # GET /story_posts/1
  # GET /story_posts/1.json
  def show
    @story_post = StoryPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story_post }
    end
  end

  # GET /story_posts/new
  # GET /story_posts/new.json
  def new
    @story_post = StoryPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story_post }
    end
  end

  # GET /story_posts/1/edit
  def edit
    @story_post = StoryPost.find(params[:id])
  end

  # POST /story_posts
  # POST /story_posts.json
  def create
    @story_post = StoryPost.new(params[:story_post])
    @story_post.story_thread = StoryThreadsController.current_thread

    respond_to do |format|
      if @story_post.save
        format.html { redirect_to @story_post, notice: 'Story post was successfully created.' }
        format.json { render json: @story_post, status: :created, location: @story_post }
      else
        format.html { render action: "new" }
        format.json { render json: @story_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /story_posts/1
  # PUT /story_posts/1.json
  def update
    @story_post = StoryPost.find(params[:id])

    respond_to do |format|
      if @story_post.update_attributes(params[:story_post])
        format.html { redirect_to @story_post, notice: 'Story post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_posts/1
  # DELETE /story_posts/1.json
  def destroy
    @story_post = StoryPost.find(params[:id])
    @story_post.destroy

    respond_to do |format|
      format.html { redirect_to story_posts_url }
      format.json { head :no_content }
    end
  end
end
