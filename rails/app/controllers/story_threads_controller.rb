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
