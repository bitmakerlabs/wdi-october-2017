class AddRankingToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column(:tracks, :ranking, :integer)
  end
end
