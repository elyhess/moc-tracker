class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: "Welcome, #{user.email}"
		else
			flash[:alert] = "Your credentials are bad, and you should feel bad"
			render :new
		end
	end

	def destroy
	end

end