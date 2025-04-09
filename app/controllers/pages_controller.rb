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
            redirect_to market_path
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
    end

    def listing_form
        @listing = Listing.new
    end

    def create_listing
        # Create a new Listing record with the form data
        @listing = Listing.new(listing_params)
    
        # Set a default User_id (e.g., 1 or the logged-in user's ID)
        @listing.user_id = 1

        @listing.created_at = Time.parse("2025-04-09 12:34:56 UTC")
        @listing.updated_at = Time.parse("2025-04-09 12:34:56 UTC")


        # Try saving the new listing to the database
        if @listing.save
            # If save is successful, render the successful_post.html.erb view
            render 'successful_post', notice: 'Your listing was successfully created.'
        else
            # If save fails, re-render the form with errors
            render :listing_form, alert: 'There was an issue creating your listing.' 
        end      
    end

    private

    # Define strong parameters to allow only permitted attributes
    def listing_params
        params.require(:listing).permit(:title, :description, :price, :location)
    end



end
