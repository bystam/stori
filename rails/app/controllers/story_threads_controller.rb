class StoryThreadsController < ApplicationController
  NEW_DAY_START = 5.hours

  # GET /story_threads
  # GET /story_threads.json
  def index
    @story_threads = StoryThread.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @story_threads }
    end
  end

  # GET /story_threads/1
  # GET /story_threads/1.json
  def show
    @story_thread = StoryThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story_thread }
    end
  end

  # GET /story_threads/new
  # GET /story_threads/new.json
  def new
    @story_thread = StoryThread.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story_thread }
    end
  end

  # GET /story_threads/1/edit
  def edit
    @story_thread = StoryThread.find(params[:id])
  end

  # POST /story_threads
  # POST /story_threads.json
  def create
    @story_thread = StoryThread.new(params[:story_thread])

    respond_to do |format|
      if @story_thread.save
        format.html { redirect_to @story_thread, notice: 'Story thread was successfully created.' }
        format.json { render json: @story_thread, status: :created, location: @story_thread }
      else
        format.html { render action: "new" }
        format.json { render json: @story_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /story_threads/1
  # PUT /story_threads/1.json
  def update
    @story_thread = StoryThread.find(params[:id])

    respond_to do |format|
      if @story_thread.update_attributes(params[:story_thread])
        format.html { redirect_to @story_thread, notice: 'Story thread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_threads/1
  # DELETE /story_threads/1.json
  def destroy
    @story_thread = StoryThread.find(params[:id])
    @story_thread.destroy

    respond_to do |format|
      format.html { redirect_to story_threads_url }
      format.json { head :no_content }
    end
  end

  def self.current_thread
    current_last = StoryThread.last
    if current_last.nil? || current_last.end.past?
      current_last = create_new_thread
    end
    return current_last
  end

  def self.create_new_thread
    new_day_midnight = DateTime.now.beginning_of_day
    new_start = new_day_midnight + 5.hours
    new_end = new_start + 1.day
    new_name = new_start.to_date.to_s

    story_thread = StoryThread.new
    story_thread.start = new_start
    story_thread.end = new_end
    story_thread.name = new_name

    if story_thread.save
      return story_thread
    else
      return nil
    end
  end
end
