class RobotsController < ApplicationController
  def index
    @robots = Robot.all
  end

  def show
    @robot = Robot.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @robot }
    end
  end
end
