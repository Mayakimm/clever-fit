class DaySummary < ApplicationRecord
  belongs_to :profile
  validates :date, presence: true
  validates :status, presence: true
end
