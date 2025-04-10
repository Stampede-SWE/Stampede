class PagesController < ApplicationController
    before_action :require_login, only: [ :market ]

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

            # message = "Something went wrong! Make sure your username and password are correct."
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        # flash[:notice] = "You have been logged out."
        redirect_to login_path
      end

    def market
        @listings = Listing.all
    end
end
