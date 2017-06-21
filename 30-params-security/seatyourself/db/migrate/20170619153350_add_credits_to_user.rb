class AddCreditsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :credits, :integer
    User.update_all(credits: 0)
  end
end
