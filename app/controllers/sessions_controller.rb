class SessionsController < ApplicationController
	def new
	end

	def create
	#	user = User.authenticate(params[:email], params[:password])
	user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
	#\/ what this is doing is the lines below - \/
	# user = User.find_by_email(params[:email])
	# if user
	# 	user.authenticate(params[:password])
	# end
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
	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"
	end
end