class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # session[:user_id] = @user.id
            redirect_to login_path
        else
            render :signup
        end
    end
    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
