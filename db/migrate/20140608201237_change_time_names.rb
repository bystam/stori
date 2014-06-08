class ChangeTimeNames < ActiveRecord::Migration
  def up
    rename_column :story_threads, :start, :start_time
    rename_column :story_threads, :end, :end_time
  end

  def down
  end
end
