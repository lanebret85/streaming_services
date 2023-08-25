class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :genre
      t.boolean :released
      t.boolean :watched
      t.integer :episodes
      t.integer :seasons
      t.integer :episode_runtime

      t.timestamps
    end
  end
end
