class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:email],params[:password])
		if user
			session[:user_id] = user.user.id
			redirect_to new_user_path, notice: "logged in"
		else
			flash.now.alert = "invalid email or pw"
			render :new
		end
	end
end