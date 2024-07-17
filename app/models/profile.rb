class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 16, less_than_or_equal_to: 99 }, allow_nil: true
  validates :gender, presence: true
  validates :goal, presence: true
  validates :height, numericality: true, allow_nil: true
  validates :weight, numericality: true, allow_nil: true

  def xp_needed_for_next_level
    level_thresholds[level] || Float::INFINITY
  end

  def check_and_update_level
    current_xp = experience_points
    level_thresholds = {
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

    self.level = level_thresholds.keys.select { |level| current_xp >= level_thresholds[level] }.max || 1
    save
  end
end
