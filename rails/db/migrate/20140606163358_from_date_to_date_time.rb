class FromDateToDateTime < ActiveRecord::Migration
  def change
    change_column :story_threads, :start, :datetime
    change_column :story_threads, :end, :datetime
  end
end
