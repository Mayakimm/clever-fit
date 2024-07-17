class AddMuscleGroupToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :muscle_group, :string
  end
end
