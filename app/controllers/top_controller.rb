class TopController < ApplicationController
	before_action :set_q, only: [:index]

	def index
	end


	private
	
	def set_q
    @q = Room.ransack(params[:q])
	end

end
