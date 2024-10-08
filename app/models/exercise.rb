class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true
  validates :met_value, presence: true, numericality: true
end
