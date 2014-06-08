class StoryThread < ActiveRecord::Base
  attr_accessible :end, :name, :start

  has_many :story_posts

  scope :finished, lambda { where('end_time < ?', DateTime.now) }
end
