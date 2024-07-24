class WorkoutExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout

  validates :kg, presence: true, numericality: true
  validates :volume, presence: true, numericality: true
end
