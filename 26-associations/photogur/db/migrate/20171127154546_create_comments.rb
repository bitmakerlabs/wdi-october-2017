class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :message
      t.integer :picture_id

      t.timestamps
    end
  end
end
