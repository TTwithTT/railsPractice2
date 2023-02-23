class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@reservations = current_user.reservations
	end

	def new_confirm
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@room = @reservation.room
		redirect_back(fallback_location: root_path) if @reservation.invalid?
	end

	
	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		if params[:back]
			flash[:notice] = "キャンセルしました"
			redirect_back(fallback_location: root_path)
		elsif @reservation.save
			flash[:notice] = "予約しました"
			redirect_to :reservations
		else
			flash[:notice] = "予約できませんでした"
			redirect_to :rooms
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def edit_confirm
		@reservation = Reservation.find(reservation_params)
		@room = @reservation.room
		redirect_back(fallback_location: root_path) if @reservation.invalid?
	end

	def update
		@reservation = Reservation.find(params[:id])
		if params[:back]
			flash[:notice] = "キャンセルしました"
			redirect_back(fallback_location: root_path)
		elsif @reservation.update(reservation_params)
			flash[:notice] = "再予約しました"
			redirect_to :reservations
		else
			flash[:notice] = "予約できませんでした"
			redirect_to :reservations
		end
	end

	def destroy
		reservation = Reservation.find(params[:id])
		reservation.destroy
		flash[:notice] = "予約をキャンセルしました"
		redirect_back(fallback_location: root_path)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:fromDate, :toDate, :numberOfGuests, :room_id)
	end
end
