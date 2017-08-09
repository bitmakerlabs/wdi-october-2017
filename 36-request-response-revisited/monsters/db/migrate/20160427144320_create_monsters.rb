class CreateMonsters < ActiveRecord::Migration[4.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :home
      t.integer :creepiness

      t.timestamps null: false
    end
  end
end
