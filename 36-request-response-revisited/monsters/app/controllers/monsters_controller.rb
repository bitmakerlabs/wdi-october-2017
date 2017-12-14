class MonstersController < ApplicationController
  def index
    @monsters = Monster.all

    # Headers
    # Request
    # Accepts: application/json, */*

    # Response
    # Content-Type: application/json, text/html, text/plain

    respond_to do |format|
      format.html
      format.text
      format.json do
        monster_array = @monsters.map do |monster|
          {
            full_name: monster.name,
            location: monster.home,
            creepiness: monster.creepiness
          }
        end

        render json: monster_array
      end
    end

  end
end
