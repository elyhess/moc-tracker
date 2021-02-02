class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = user_params
        user[:email] = user[:email].downcase
        new_user = User.create(user)
        flash[:success] = "Welcome, #{new_user.email}"
        redirect_to root_path
    end

    def login_form
    end

    def login
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            # TODO Tim is going to add code right here
            flash[:success] = "Welcome, #{user.email}"
            redirect_to root_path
        else
            flash[:error] = 'Your credentials are bad, and you should feel bad'
            render :login_form
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end