class Profile < ApplicationRecord
  LEVEL_THRESHOLDS = {
    55 => 148700,
    54 => 143300,
    53 => 138000,
    52 => 132800,
    51 => 127700,
    50 => 122700,
    49 => 117800,
    48 => 113000,
    47 => 108300,
    46 => 103700,
    45 => 99200,
    44 => 94800,
    43 => 90500,
    42 => 86300,
    41 => 82200,
    40 => 78200,
    39 => 74300,
    38 => 70500,
    37 => 66800,
    36 => 63200,
    35 => 59700,
    34 => 56300,
    33 => 53000,
    32 => 49800,
    31 => 46700,
    30 => 43700,
    29 => 40800,
    28 => 38000,
    27 => 35300,
    26 => 32700,
    25 => 30200,
    24 => 27800,
    23 => 25500,
    22 => 23300,
    21 => 21200,
    20 => 19200,
    19 => 17300,
    18 => 15500,
    17 => 13800,
    16 => 12200,
    15 => 10700,
    14 => 9300,
    13 => 8000,
    12 => 6800,
    11 => 5700,
    10 => 4700,
    9 => 3800,
    8 => 3000,
    7 => 2300,
    6 => 1700,
    5 => 1200,
    4 => 800,
    3 => 500,
    2 => 250,
    1 => 100

  }
  # Starts a new user at 0 xp
  after_initialize :set_default_stats, if: :new_record?

  belongs_to :user
  has_many :day_summaries, dependent: :destroy
  has_many :workouts, through: :user
  has_many :workout_exercises, through: :workouts

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 16, less_than_or_equal_to: 99 }
  validates :gender, presence: true
  validates :goal, presence: true
  validates :height, numericality: true
  validates :weight, numericality: true

  # For the Levelling sytem

  def total_time_spent_in_gym
    time_stamps = day_summaries.pluck(:start_time, :end_time)
    seconds = time_stamps.map do |t|
      t.last - t.first
    end.sum
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    "#{hours.to_i}h #{minutes.to_i}m"
  end

  def total_kg_lifted_all
    self.total_volume_lifted = 0 if self.total_volume_lifted == nil
    self.total_volume_lifted += workout_exercises.sum(:kg)
    save
    total_volume_lifted
  end

  def total_workouts_logged
    workouts.count
  end

  def set_default_stats
    self.experience_points ||= 0
    self.total_volume_lifted ||= 0
  end

  def self.calculate_xp(total_kg_lifted, duration_minutes)
    xp_per_kg = 2.5
    xp_per_minute = 1
    gained_xp = (total_kg_lifted * xp_per_kg) + (duration_minutes * xp_per_minute)
    gained_xp.round
    self.level = LEVEL_THRESHOLDS.keys.select { |lvl| self.experience_points >= LEVEL_THRESHOLDS[lvl] || 1 }
    save
  end

  def xp_level
    self.level = LEVEL_THRESHOLDS.keys.select { |lvl| self.experience_points >= LEVEL_THRESHOLDS[lvl] || 1 }
    save
    level
  end

  def add_workout_xp(total_kg_lifted, duration_minutes)
    self.experience_points += self.class.calculate_xp(total_kg_lifted, duration_minutes)
    xp_level
    save
  end

  private :set_default_stats, :xp_level
end
