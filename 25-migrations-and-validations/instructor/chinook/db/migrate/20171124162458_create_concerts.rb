class CreateConcerts < ActiveRecord::Migration[5.1]
  def change
    create_table :concerts do |t|
      t.string :name
      t.datetime :played_at
      t.integer :attendance
      t.text :description

      t.timestamps
    end
  end
end
