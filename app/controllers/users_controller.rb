class UsersController < ApplicationController
	def new
		@new_user = User.new
	end
	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to new_user_path, notice: "You Signed up!"
		else
			render :new, notice: "You failed."
		end
	end

	private
	def user_params
		params.require(:user).permit!
	end
end