class Profile < ApplicationRecord
  belongs_to :user

  validates :age, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: true
  validates :height, presence: true, numericality: true
  validates :gender, presence: true
end
