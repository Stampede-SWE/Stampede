class PagesController < ApplicationController
    before_action :require_login, only: [ :profile, :editprofile, :resetpassword]
    before_action :set_user, only: [:profile, :editprofile, :resetpassword]

    def login
    end

    def signup
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to listings_path
        else
            flash[:alert] = "Incorrect username or password!"
            redirect_to login_path
        end
    end

    def editprofile
        if @user != current_user
            redirect_to profile_path
        end
    end

    def resetpassword
        if @user != current_user
            redirect_to profile_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to login_path
    end

    def market
        @listings = Listing.all
    end
    
    private

    def set_user
        @user = User.find_by(id: session[:user_id])
    end
end

