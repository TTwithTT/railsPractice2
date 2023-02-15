class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

	def new
		@reservations = Reservation.new
	end

	def confirm
		@reservations = Reservation.new(reservation_params)
		if @reservation.invalid?
			redirect_back(fallback_location: root_path) 
		end
	end

	# def reservation_params
	# 	params.require(:reservation).permit(:etc).merge(user_id: current_user.id)
	# end
	
end
