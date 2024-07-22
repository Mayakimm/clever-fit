class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :workouts
  has_many :group_classes
  has_one :profile, dependent: :destroy

  after_create :create_profile

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  private

  def create_profile
    Profile.create(user: self)
  end

  def total_time_spent_in_gym
    workouts.sum('EXTRACT(EPOCH FROM (end_time - start_time))').to_i
    hours = total_seconds / 3600
    minutes = (total_seconds % 3600) / 60
    "#{hours} hours #{minutes} minutes"
  end

  def total_kg_lifted_all
    workout_exercises.sum(:kg)
  end

  def total_workouts_logged
    workouts.count
  end
end
