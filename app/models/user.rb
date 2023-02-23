class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness:true, format: { with: VALID_EMAIL_REGEX }, on: :create
  validates :password, presence: true, on: :create
  # validates :introductionj, presence: true

  has_many :reservations, dependent: :destroy

  mount_uploader :image, ImageUploader
end
