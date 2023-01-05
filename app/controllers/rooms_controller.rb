class RoomsController < ApplicationController

	def index
		@q = Room.ransack(params[:q])
		@rooms = @q.result.includes(:user).order(:created_at: :desc)
	end

	# private

	# def set_q
	# 	@q = Room.ransack(params[:q])
	# end
end
