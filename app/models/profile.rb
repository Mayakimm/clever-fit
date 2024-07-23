class Profile < ApplicationRecord
  LEVEL_THRESHOLDS = {
    1   => 100,
    2   => 250,
    3   => 500,
    4   => 800,
    5   => 1200,
    6   => 1700,
    7   => 2300,
    8   => 3000,
    9   => 3800,
    10  => 4700,
    11  => 5700,
    12  => 6800,
    13  => 8000,
    14  => 9300,
    15  => 10700,
    16  => 12200,
    17  => 13800,
    18  => 15500,
    19  => 17300,
    20  => 19200,
    21  => 21200,
    22  => 23300,
    23  => 25500,
    24  => 27800,
    25  => 30200,
    26  => 32700,
    27  => 35300,
    28  => 38000,
    29  => 40800,
    30  => 43700,
    31  => 46700,
    32  => 49800,
    33  => 53000,
    34  => 56300,
    35  => 59700,
    36  => 63200,
    37  => 66800,
    38  => 70500,
    39  => 74300,
    40  => 78200,
    41  => 82200,
    42  => 86300,
    43  => 90500,
    44  => 94800,
    45  => 99200,
    46  => 103700,
    47  => 108300,
    48  => 113000,
    49  => 117800,
    50  => 122700,
    51  => 127700,
    52  => 132800,
    53  => 138000,
    54  => 143300,
    55  => 148700,
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
    self.total_volume_lifted += workout_exercises.sum(:kg)
    save
    total_volume_lifted
  end

  def total_workouts_logged
    workouts.count
  end

  def set_default_stats
    self.experience_points ||= 0
  end

  def self.calculate_xp(total_kg_lifted, duration_minutes)
    xp_per_kg = 2.5
    xp_per_minute = 1
    gained_xp = (total_kg_lifted * xp_per_kg) + (duration_minutes * xp_per_minute)
    gained_xp.round
  end

  def xp_level
    self.level = LEVEL_THRESHOLDS.keys.select { |l| self.experience_points >= LEVEL_THRESHOLDS[l] }.max || 1
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
