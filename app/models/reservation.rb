class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :room

	validates :fromDate, presence: true
	validates :toDate, presence: true
	validates :numberOfGuests, presence: true

	validate :fromDate_before_toDate
	def fromDate_before_toDate
		if toDate.present? && fromDate.present? && toDate < fromDate then
			errors.add(:toDate, 'チェックアウト日はチェックイン日以降の日付を選択してください')
		end
	end
end
