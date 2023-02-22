class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :edit, :update, :destroy]
	before_action :search, only: [:index]

	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def show
	end

	def edit
	end

	def create
		@room = Room.new(room_params)
		@room.user_id = current_user.id
		if @room.save
			flash[:notice] = "物件情報を登録しました"
			redirect_to :rooms
		else
			flash[:notice] = "物件情報を登録できませんでした"
			render "new", status: :unprocessable_entity
		end
	end

	def update
		@room = Room.find(params[:id])
		if @room.update(room_params)
			flash[:notice] = "物件情報を編集しました"
			redirect_back(fallback_location: root_path)
		else
			render "edit"
		end
	end
	
	def destroy
		@schedule.destroy
		flash[:notice] = "物件情報を削除しました"
		redirect_back(fallback_location: root_path)
	end

	def own
		@rooms = current_user.rooms
	end

	private

	def set_room
		@room = Room.find(params[:id])
	end
	
	def search
    @q = Room.ransack(params[:q])
		@results = @q.result
	end

	def room_params
		params.require(:room).permit(:name, :description, :price, :address, :image)
	end

end
