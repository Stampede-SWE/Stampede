class ListingsController < ApplicationController
  before_action :require_login, only: [ :index, :show ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]

  def index
    @listings = Listing.all
  end
  def show
    @listing = Listing.find(params[:id])
  end


  def new
    @listing = Listing.new
  end

  #create the listing
  def create
    @listing = current_user.listings.build(listing_params)
 
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfuly created.'
    else
      render :new
    end
  end
  

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listings_path, notice: "Listing updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, notice: "Listing deleted."
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :category, :location, :image)
  end

  def correct_user
    @listing = Listing.find(params[:id])
    unless @listing.user == current_user
      redirect_to listings_path, alert: "You can only manage your own listings."
    end

  end
end
