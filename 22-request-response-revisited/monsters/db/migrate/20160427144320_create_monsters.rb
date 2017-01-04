class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :home
      t.integer :creepiness

      t.timestamps null: false
    end
  end
end
