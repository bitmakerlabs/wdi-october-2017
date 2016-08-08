class RobotsController < ApplicationController
  before_action :load_robot, only: [:show]

  def index
    @robots = Robot.all
  end

  def show
    # @robot = Robot.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @robot }
    end
  end

  def recharge
    # recharge the robots batteries
  end

  private

  # We're only putting these methods in the private section because they aren't
  # public actions that can be called by clients of our app,
  # they only serve as helpers to the public actions

  def load_robot
    @robot = Robot.find(params[:id])
  end

  # Strong Parameters method
  # Removes any keys in the params hash that aren't specified in the permit list
  # This protects us from malicious users hacking our forms
  # Only needed when we're going to *write* to the database
  def robot_params
    params.require(:robot).permit(:name, :address)
  end
end
