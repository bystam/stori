class StoryThread < ActiveRecord::Base
  attr_accessible :end, :name, :start

  has_many :story_posts
end
