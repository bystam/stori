class CreateStoryPosts < ActiveRecord::Migration
  def change
    create_table :story_posts do |t|
      t.string :text
      t.references :story_thread

      t.timestamps
    end
  end
end
