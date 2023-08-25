class RemoveWatchedFromShows < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :watched
  end
end
