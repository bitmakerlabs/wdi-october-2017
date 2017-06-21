class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # if session[:user_id]
    #   u = User.find(session[:user_id])
    # end
    #
    # if u
    #   u
    # else
    #   false
    # end

    # Exactly the same as:
    session[:user_id] && User.find(session[:user_id])
  end

end
