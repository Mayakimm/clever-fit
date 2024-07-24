class AddIconToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :icon, :text
  end
end
