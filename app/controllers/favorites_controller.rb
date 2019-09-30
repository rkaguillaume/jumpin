class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @favorites = current_user.favorites
  end

  def create
    @stop = Stop.find(params[:stop_id])
    @favorite = @stop.favorites.new(user: current_user)
    @favorite.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.js
    end

  end
end
