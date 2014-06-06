class StoryPost < ActiveRecord::Base
  attr_accessible :story_thread, :text

  belongs_to :story_thread
end
