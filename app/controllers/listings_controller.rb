class ListingsController < ApplicationController
  before_action :require_login, only: [ :index, :show ]

  def index
    @listings = Listing.all
  end
  def show
    @listing = Listing.find(params[:id])
  end
end
