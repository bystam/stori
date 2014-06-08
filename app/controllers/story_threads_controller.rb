class StoryThreadsController < ApplicationController
  NEW_DAY_START = 5.hours

  # GET /story_threads
  # GET /story_threads.json
  def index
    @last_words = StoryThreadsController.current_thread.story_posts.last.last_words
    @finished_threads = StoryThread.finished
    @story_post = StoryPost.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /story_threads/1
  # GET /story_threads/1.json
  def show
    @story_thread = StoryThread.find(params[:id])

    respond_to do |format|
      if (@story_thread.end_time.future?)
        format.html { redirect_to root_path, notice: 'Thread is not finished and cannot be viewed.' }
      else
        format.html # show.html.erb
      end
    end
  end

  def self.current_thread
    current_last = StoryThread.last
    if current_last.nil? || current_last.end_time.past?
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
    story_thread.start_time = new_start
    story_thread.end_time = new_end
    story_thread.name = new_name
    add_default_post story_thread

    if story_thread.save
      return story_thread
    else
      return nil
    end
  end

  def self.add_default_post(story_thread)
    default = StoryPost.new
    default.text = "Idag har jag"
    default.story_thread = story_thread

    if default.save
      return default
    else
      return nil
    end
  end
end
