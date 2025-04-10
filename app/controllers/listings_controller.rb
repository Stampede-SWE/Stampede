class ListingsController < ApplicationController
  before_action :require_login, only: [ :index ]

  def index
    @listings = Listing.all
  end
end
