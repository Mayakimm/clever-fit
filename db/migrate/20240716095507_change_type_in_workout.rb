class ChangeTypeInWorkout < ActiveRecord::Migration[7.1]
  def change
    rename_column :workouts, :type, :workout_type
  end
end
