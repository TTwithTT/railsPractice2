class ReservationsController < ApplicationController
	def index
		@reservations = Reservation.all
	end

	def confirm
		@reservations = Reservation.new(reservation_params)
		@room = Room.find(params[:id])
	end
	
	def create
		@reservation = Reservation.new(reservation_params)
		@room = Room.find(params[:id])
		if params[:back]
			redirect_back(fallback_location: root_path) 
		end

		respond_to do |format|
			if @reservation.save
				redirect_to :reservations
			else
				redirect_to :rooms
			end
	end

	private
	# def reservation_params
	# 	params.require(:reservation).permit(:etc).merge(user_id: current_user.id)
	# end

end
