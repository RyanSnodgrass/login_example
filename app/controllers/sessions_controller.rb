class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			#session starts as an empty hash
			#basically creating a hash {session: {user_id: user.id}}
			session[:user_id] = user.id #session is a rails variable for cookies stored in browser
				# session[:user_id] is arbitrary. if i want i can call it session[:current_user_id]
			redirect_to new_user_path, notice: "logged in"
		else
			flash.now.alert = "invalid email or pw"
			render :new
		end
	end
end