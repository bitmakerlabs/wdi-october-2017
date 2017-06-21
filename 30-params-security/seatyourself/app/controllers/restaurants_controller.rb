class RestaurantsController < ApplicationController
  def index
  end

  def show

    Rails.logger.info "*** params[:controller] = #{ params[:controller] }"
    Rails.logger.info "*** params[:action] = #{ params[:action] }"
    Rails.logger.info "*** params[:id] = #{ params[:id] }"
    Rails.logger.info "*** params[:lang] = #{ params[:lang] }"

    @lang = params[:lang]
    @country = params[:country]
    @restaurant = Restaurant.find(params[:id])
  end

  def search
    statement = "SELECT * FROM restaurants WHERE name = '" + params[:search][:q] + "'"

    Rails.logger.info "***** #{statement}"

    @restaurant = Restaurant.find_by_sql(statement)
  end
end

# Querystring
