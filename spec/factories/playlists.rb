FactoryGirl.define do
  factory :playlist do
    pid "xpy-12"
    name "Foo"
    external_urls "http://example.com"
    playlist_image "http://example.com/img.jpg"
    tracks_url "http://example.com/tracks"
    total_tracks "20"
    is_public true
    
    factory :playlists_with_user do

      transient do
        users_count 5
      end

      after(:create) do |playlist, evaluator|
        create_list(:playlist, evaluator.users_count, playlist: playlist)
      end
    end
  end
end
