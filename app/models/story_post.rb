class StoryPost < ActiveRecord::Base
  LAST_WORD_AMOUNT = 3

  attr_accessible :story_thread, :text

  belongs_to :story_thread

  validates :text, :length => { :maximum => 140, :minimum => 1 }

  def last_words
    last_words = text.split(" ").last(LAST_WORD_AMOUNT)
    return last_words.join(" ")
  end
end
