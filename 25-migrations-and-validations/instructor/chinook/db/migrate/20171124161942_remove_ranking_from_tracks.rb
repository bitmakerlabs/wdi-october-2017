class RemoveRankingFromTracks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tracks, :ranking, :integer
  end
end
