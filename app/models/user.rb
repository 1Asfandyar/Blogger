# frozen_string_literal: true

# user model , added roles , association and validations
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  enum role: %i[user moderator admin]

  has_many :posts, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy

  acts_as_voter

  validates :email, :password, presence: true
  validates :email, uniqueness: { message: 'Email already exists' }
  validates :password, length: { in: 5..15 }
  validates :email, length: { minimum: 15 }
  validates :firstname, :lastname, presence: true
  validates :firstname, :lastname, length: { minimum: 3 }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
