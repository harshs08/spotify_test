class FetchPlaylists
  @queue = :fetch_playlists
  
  def self.perform(user_id)
    user = User.find(user_id)
    user.add_playlists
  end
end