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

  def calculate_xp
    xp = 0

    xp += workouts.sum(:total_volume) / 10

    xp += achievements.sum(:points)

    update(experience_points: xp)
  end
end
