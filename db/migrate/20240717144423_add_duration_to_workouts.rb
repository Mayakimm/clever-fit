class AddDurationToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :duration, :integer
  end
end
