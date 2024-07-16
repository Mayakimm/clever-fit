class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :workouts
  has_many :group_classes

<<<<<<< HEAD
  has_one :profile

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
=======
  has_one :profile, dependent: :destroy
  after_create :create_profile

  private

  def create_profile
    Profile.create(user: self)
  end
>>>>>>> master
end
