class ProductsController < ApplicationController
  def index
    response = HTTParty.get("https://lcboapi.com/products?access_key=#{ENV['LCBO_KEY']}")
    # response = HTTParty.get('https://lcboapi.com/products', headers: { 'Authorization' => "Token #{ENV['LCBO_KEY']}" })

    # @name = response.parsed_response["result"][0]["name"]

    @products = []

    response.parsed_response["result"].each do |r|
      @products << { name: r["name"], image: r["image_thumb_url"] }
    end

    respond_to do |format|
      format.json {
        render json: { products: @products }
      }

      format.html {
        render :index
      }
    end
  end
end
