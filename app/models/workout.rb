class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates :start_time, presence: true
  validates :end_time, presence: true
end
