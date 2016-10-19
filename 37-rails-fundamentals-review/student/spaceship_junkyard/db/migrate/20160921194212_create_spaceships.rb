class CreateSpaceships < ActiveRecord::Migration[5.0]
  def change
    create_table :spaceships do |t|
      t.string      :name
      t.string      :universe
      t.string      :max_speed
      t.text        :history
      t.string      :image_url
      t.timestamps
    end
  end
end
