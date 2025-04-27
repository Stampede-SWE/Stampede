class UsersController < ApplicationController
    def signup
        @user = User.new
    end

    def create
        existingUser = User.exists?(username: user_params[:username])
        if !existingUser
            @user = User.new(user_params)
            if @user.save
                # session[:user_id] = @user.id
                flash[:notice] = "Signed up successfully!"
                redirect_to login_path
            else
                @user.errors.full_messages.each do |message|
                flash[:alert] = message
            end
            redirect_to signup_path
            end
        else
            flash[:alert] = "That username already exists!"
            redirect_to signup_path
        end
    end
    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :phone, :email)
    end
end
