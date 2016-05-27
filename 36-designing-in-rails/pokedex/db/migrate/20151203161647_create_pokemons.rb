class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.integer :happiness
      t.integer :speed
      t.string :species
      t.string :growth_rate
      t.string :image_url

      t.timestamps null: false
    end
  end
end
