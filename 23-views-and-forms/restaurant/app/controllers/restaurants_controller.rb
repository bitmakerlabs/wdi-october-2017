class RestaurantsController < ApplicationController

  def index
    render :index
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create

    restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      capacity: params[:restaurant][:capacity],
    )
    # restaurant = Restaurant.new(params[:restaurant])
    restaurant.save
  end
end
