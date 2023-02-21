class ReservationsController < ApplicationController
	def index
		@reservations = current_user.reservations
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def confirm
		if params[:new]
			@reservation = Reservation.new(reservation_params)
			redirect_to :back if @reservation.invalid?
		else
			@reservation = Reservation.find(params[:id])
			redirect_to :back if @reservation.invalid?
	end
	
	def create
		@reservation = Reservation.new(reservation_params)
		@room = Room.find(params[:id])
		if params[:back]
			redirect_back(fallback_location: root_path) 
		end
		if @reservation.save
			redirect_to :reservations
		else
			redirect_to :rooms
		end
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update(reservation_params)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:fromDate, :toDate, :numberOfGuests, :room_id).merge(user_id: current_user.id)
	end

end
