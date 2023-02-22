class UsersController < ApplicationController

	def pofile
		@user = current_user
	end

	def account
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			flash[:notice] = "プロフィールを更新しました"
			redirect_to root_path
		else
			render "edit"	
		end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end
end
