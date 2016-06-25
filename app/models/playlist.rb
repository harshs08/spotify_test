class Playlist < ActiveRecord::Base
  has_many :users_playlists
  has_many :users, through: :users_playlists
  validates_uniqueness_of :pid

  def self.populate(playlist_items)
    playlist                = find_or_create_by(pid: playlist_items['id'])
    playlist.name           = playlist_items['name']
    playlist.external_urls  = playlist_items['external_urls']['spotify']
    playlist.playlist_image = playlist_items['images'].first['url'] if playlist_items['images']
    playlist.tracks_url     = playlist_items['tracks']['href']
    playlist.total_tracks   = playlist_items['tracks']['total']
    playlist.is_public      = playlist_items['public']
    playlist.save!
    playlist
  end

end
