class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])

    if u && u.authenticate(params[:session][:password])
      flash[:notice] = 'Login successful'
      redirect_to root_url
    else
      flash[:error] = 'Access DENIED!'
      render :new
    end

  end

  def destroy
  end
end
