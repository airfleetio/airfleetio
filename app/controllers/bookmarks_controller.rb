class BookmarksController < ApplicationController
  before_action :set_vehicles

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to root_url, notice: 'Vehicle was successfully saved.'
    else
      render :new
    end
  end

private

  def set_vehicles
    @vehicles = Vehicle.bookmarked
  end

  def bookmark_params
    params.require(:bookmark).permit(:vin)
  end
end
