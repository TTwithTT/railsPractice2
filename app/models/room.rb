class Room < ApplicationRecord
	has_many :reservations

  mount_uploader :avatar, AvatarUploader

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :address, presence: true
end
