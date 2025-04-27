class ListingsController < ApplicationController
  before_action :require_login, only: [ :index, :show ]

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
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :location, :category)
  end
end
