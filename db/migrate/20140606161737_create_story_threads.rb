class CreateStoryThreads < ActiveRecord::Migration
  def change
    create_table :story_threads do |t|
      t.date :start
      t.date :end
      t.string :name

      t.timestamps
    end
  end
end
