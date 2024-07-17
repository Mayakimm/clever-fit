class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates :start_time, presence: true
  validates :end_time, presence: true

  def calculate_total_volume
    total_volume = workout_exercises.sum(:volume)
    update(total_volume: total_volume)
    total_volume
  end
end
