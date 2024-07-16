class AddTimesToWorkout < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :start_time, :datetime
    add_column :workouts, :end_time, :datetime
  end
end
