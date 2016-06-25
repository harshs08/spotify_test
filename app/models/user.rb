require 'json'
require 'net/http'

class User < ActiveRecord::Base
  has_many :users_playlists
  has_many :playlists, through: :users_playlists
  validates :uid, uniqueness: true

  def self.from_omniauth(auth_hash)
    user               = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name          = auth_hash['info']['name']
    user.email         = auth_hash['info']['email']
    user.image_url     = auth_hash['info']['image']
    user.spotify_url   = auth_hash['info']['urls']['spotify']
    user.access_token  = auth_hash['credentials']['token']
    user.refresh_token = auth_hash['credentials']['refresh_token']
    user.expires_at    = Time.at(auth_hash['credentials']['expires_at']).to_datetime
    user.save!
    user
  end

  def to_params
    { 'refresh_token' => refresh_token,
      'client_id' => ENV['SPOTIFY_CLIENT_ID'],
      'client_secret' => ENV['SPOTIFY_CLIENT_SECRET'],
      'grant_type' => 'refresh_token'
    }
  end

  def request_token_from_spotify
    url = URI("https://accounts.spotify.com/api/token")
    Net::HTTP.post_form(url, self.to_params)
  end

  def refresh!
    response = request_token_from_spotify
    data = JSON.parse(response.body)
    update_attributes(
    access_token: data['access_token'],
    expires_at: Time.now + (data['expires_in'].to_i).seconds)
  end

  def expired?
    expires_at < Time.now
  end

  def fresh_token
    refresh! if expired?
    access_token
  end

  def get_playlists_from_spotify(limit=20, offset=0)
    uri              = URI("https://api.spotify.com/v1/users/#{uid}/playlists?limit=#{limit}&offset=#{offset}")
    http             = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request          = Net::HTTP::Get.new(uri.request_uri, {"Authorization" => "Bearer #{fresh_token}", "Accept" => "application/json"})
    http.request(request)
  end

  def add_playlists
    offset, limit = 0, 20
    response     = get_playlists_from_spotify(limit, offset)
    data         = JSON.parse(response.body)
    populate_playlists(data)
    total        = data['total']
    loops        = (total.to_f/limit.to_f).round - 1

    (1..loops).each do |i|
      offset += 20
      response = get_playlists_from_spotify(limit, offset)
      populate_playlists(JSON.parse(response.body))
    end
  end
  
  def populate_playlists(playlist=nil)
    playlist['items'].map do |item|
       playlist = Playlist.populate(item)
       self.users_playlists.create(playlist: playlist)
     end
  end
end
