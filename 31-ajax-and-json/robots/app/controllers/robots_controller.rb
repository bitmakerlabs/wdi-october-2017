class RobotsController < ApplicationController
  def index
    @robots = Robot.all
  end

  def show
    @robot = Robot.find(params[:id])

    respond_to do |format|
      # format.html do
      #   if request.xhr?
      #     render layout: false
      #   end
      # end

      format.html
      format.json { render json: @robot }
    end

  end
end
