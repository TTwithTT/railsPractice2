class RoomsController < ApplicationController
	before_action :set_room, only: [:show. :edit, :update, :destroy]
	before_action :set_q, only: [:index, :search]

	def index
		@rooms = Room.all
	end

	def new
		@schedule = Schedule.new
	end

	def show
	end

	def edit
	end

	def create
		@room = Room.new(user_id: current_user.id, room_params)
		if @room.save
			flash[:notice] = "物件情報を登録しました"
			redirect_to :back
		else
			flash[:notice] = "物件情報を登録できませんでした"
			render "new", status: :unprocessable_entity
		end
	end

	def update
		if @roomj.update(room_params)
			flash[:notice] = "物件情報を編集しました"
			redirect_to :back
		else
			render "edit"
		end
	end
	
	def destroy
		@schedule.destroy
		flash[:notice] = "物件情報を削除しました"
		redirect_to :back
	end

	def own
		@rooms = Room.find(:user_id current_user.id)
	end

	def search
		@results = @q.result
	end

	private

	def set_room
		@room = Room.find(params[:id])
	end
	
	def set_q
    @q = Room.ransack(params[:q])
	end

	def room_params
		params.require(:room).permit(:name, :description, :price, :address, :image)
	end
end
