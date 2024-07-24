class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :workouts
  has_many :workout_exercises, through: :workouts
  has_many :group_classes
  has_one :profile, dependent: :destroy
  has_many :user_achievements
  has_many :users, through: :user_achievements

  after_create :create_profile

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def add_pushups(integer)
    self.pushups_counter ||= 0
    self.pushups_counter += integer
    save
  end

  def add_squats(integer)
    self.squats_counter ||= 0
    self.squats_counter += integer
    save
  end

  def add_pullups(integer)
    self.pullups_counter ||= 0
    self.pullups_counter += integer
    save
  end

  private

  def create_profile
    Profile.create(user: self)
  end

end
