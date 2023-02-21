class Room < ApplicationRecord
	has_many :reservations

  mount_uploader :avatar, AvatarUploader
end
