class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 16, less_than_or_equal_to: 99 }, allow_nil: true
  validates :gender, presence: true
  validates :goal, presence: true
  validates :height, numericality: true, allow_nil: true
  validates :weight, numericality: true, allow_nil: true
end
