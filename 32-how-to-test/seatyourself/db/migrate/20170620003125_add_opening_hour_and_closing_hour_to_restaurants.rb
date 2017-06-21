class AddOpeningHourAndClosingHourToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :opening_hour, :integer
    add_column :restaurants, :closing_hour, :integer
  end
end
