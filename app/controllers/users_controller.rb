class UsersController < ApplicationController
	# before_action :set_user, only: [:account, :profile, :edit, :update]
	before_action :set_user, only: [:account, :profile, :edit]
	before_action :set_current_user, only: [:update]


	def account
	end

	def pofile
	end

	def edit
		unless @user == current_user
			redirect_to profile_user_path(current_user)
		end
	end

	def update
		if current_user.update(user_params)
			flash[:notice] = "プロフィールを更新しました"
			redirect_to profile_user_path
		else
			redirect_to edit_user_path
		end
	end

	private
	def set_current_user
		@user = current_user
	end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end
end
