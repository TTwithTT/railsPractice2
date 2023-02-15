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
		if @user.update(params.require(:user).permit(:name, :introduction))
			flash[:notice] = "プロフィールを更新しました"
			redirect_to :back
		else
			render "edit"	
		end
end
