class RestaurantsController < ApplicationController

  def index
    if params[:search]
      @restaurants = Restaurant.near(params[:search])
    elsif params[:lat]
      @restaurants = Restaurant.near([params[:lat], params[:lon]])
    else
      @restaurants = Restaurant.all
    end

    if request.xhr?
      render @restaurants
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
    @nearby_restaurants = @restaurant.nearbys(2, unit: :km)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_url
    else
      render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:address, :description, :name, :phone, :picture, :category, :capacity)
  end
end
