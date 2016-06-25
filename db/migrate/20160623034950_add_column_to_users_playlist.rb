class AddColumnToUsersPlaylist < ActiveRecord::Migration
  def change
    add_column :users_playlists, :user_id, :integer
    add_column :users_playlists, :playlist_id, :integer
    add_index :users_playlists, [:user_id, :playlist_id]
  end
  
end
