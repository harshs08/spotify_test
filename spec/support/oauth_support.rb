module OauthSupport
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:spotify] = {
    'provider' => "spotify",
    'uid' => "1111111111",
    'info' => {
      'name' => "Harsh Singh",
      'email' => "harshs08@gmail.com",
      'urls' => { 'spotify' => "https://open.spotify.com/user/1111111111"},
      'image' => 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/blaa.jpg'

    },
    'credentials' => {
      'token' => "xxxx",
      'refresh_token' => "xxxx",
      'expires_at' => 1403021232,
      'expires' => true
    }
  }
end