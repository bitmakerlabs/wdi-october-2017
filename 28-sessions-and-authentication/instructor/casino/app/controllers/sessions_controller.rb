class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])

    if u && u.authenticate(params[:session][:password])
      flash[:notice] = 'Login successful'

      # Put on the wristband
      session[:user_id] = u.id

      redirect_to root_url
    else
      flash[:error] = 'Access DENIED!'
      render :new
    end

  end

  def destroy
    # Cut the wristband
    session[:user_id] = nil
    redirect_to root_url
  end
end

# These 3 magic hashes are always avilable to you in a SessionsController
# params
# flash
# session
