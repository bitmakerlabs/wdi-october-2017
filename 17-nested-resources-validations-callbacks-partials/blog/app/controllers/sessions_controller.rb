class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You successfully logged in!"
      redirect_to posts_url
    else
      flash.now[:alert] = "Wrong email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_url
  end
end
