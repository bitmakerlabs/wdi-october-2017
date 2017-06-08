class RidesController < ApplicationController

  def show
    get_name_and_description
  end

  def index
    @rides = { lorem: lorem_ride, bacon: bacon_ride, hodor: game_of_thrones_ride }
  end

  def new
    # Code to display the new form
  end

  def create
    # Code to create a new ride
    redirect_to rides_path
  end

  def edit
    get_name_and_description
  end

  def update
    # Code to update the ride
    redirect_to rides_path
  end

  def destroy
    # Code to destroy a record
    redirect_to rides_path
  end

  def get_name_and_description
    @ride_name = params[:id]

    @description =
      case @ride_name
        when 'lorem'
          lorem_ride
        when 'bacon'
          bacon_ride
        when 'hodor'
          game_of_thrones_ride
        else
          "Sorry, we don't have that ride."
        end
  end

  def about
    render plain: "Welcome to Ipsum's Fair!  Come for our rides, stay for our hotdogs."
  end

  def lorem_ride
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  end

  def bacon_ride
    'Bacon ipsum dolor amet pastrami alcatra kevin ribeye turkey, spare ribs shank jerky.'
  end

  def game_of_thrones_ride
    'Hodor, hodor; hodor HODOR hodor, hodor hodor? Hodor hodor - hodor...'
  end


end
