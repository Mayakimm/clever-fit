class AddVolumeToWorkoutExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :workout_exercises, :volume, :integer
  end
end
