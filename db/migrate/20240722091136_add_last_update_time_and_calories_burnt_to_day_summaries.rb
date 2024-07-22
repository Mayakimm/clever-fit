class AddLastUpdateTimeAndCaloriesBurntToDaySummaries < ActiveRecord::Migration[7.1]
  def change
    add_column :day_summaries, :last_update_time, :datetime
    add_column :day_summaries, :calories_burnt, :float
  end
end
