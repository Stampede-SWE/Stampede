class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :resetpassword]

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

    def update
        if @user.update(user_params)
            flash[:notice] = "Updated successfully!"
            redirect_to profile_path # Redirect to the show page after update
        else
            if @user.errors[:username].include?("only letters and no symbol or spaces")
                flash[:alert] = "Username can only contain letters. No symbols or spaces."
                redirect_to edit_profile_path
            elsif @user.errors[:password_confirmation].include?("doesn't match Password")
                flash[:alert] = "Passwords must match."
                redirect_to reset_password_path
            else
                flash[:notice] = "There was an error updating your profile."
                redirect_to profile_path
            end
        end
    end

    def resetpassword
        if @user.update(password: params[:password])
            flash[:notice] = "Password updated successfully!"
            redirect_to profile_path
        else
            flash[:alert] = "Failed to update password."
            redirect_to edit_password_path
        end
    end

    private

    def set_user
        @user = User.find_by(id: current_user[:id])
        if @user.nil?
            flash[:alert] = "User not found."
            redirect_to root_path
        end
    end
    
    def user_params
        params.require(:user).permit(:username, :password, :phone, :email, :displayname, :password_confirmation)
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
