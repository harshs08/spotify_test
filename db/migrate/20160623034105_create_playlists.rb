class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :pid, :index, unique: true
      t.string :name
      t.string :external_urls
      t.string :playlist_image
      t.string :tracks_url
      t.string :total_tracks
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
