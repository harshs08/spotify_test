FactoryGirl.define do
  factory :user do
    provider "spotify"
    uid "1295355766"
    name "Harsh Singh"
    email "arshs08@gmail.com"
    spotify_url "https://open.spotify.com/user/1295355766"
    image_url "https://scontent.xx.fbcdn.net/v/t1.0-1/p200x200/11209577_10205991505722017_419530081736519025_n.jpg?oh=d03859df1288194a330d1018111860a6&oe=58076002"
    access_token "BQD3KfPFwYTHEDqdXkPTfBOHayfBjPmdLBt8FsAoqna9cXR378h0xmPbIi7SP83aSoJYgXoM6kjPZhSP18HOMwVaFEqqHnNC9P3f7QRiGgLejFGX2BSPqGKi8UTl6atdgf8xkzQtgi4N-NOxWQKNDy0zwVGfvdQe9K2uDv7kvPEM0v8"
    refresh_token "AQBbvDQSEAJgb7FGjJrm0dhTboqw0PMEZSU9hnWG6W1S8e7eCzdusDXRjKSIrOvUt8EHweCPu2B8GUEmCa7WtgmunaxN4SOtlUyBNS73fkzrK6W_kQaEO_E1fIchsgT7iwg"
    expires_at "2016-06-24 20:10:38"
    
    factory :user_with_playlist do

      transient do
        playlists_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:playlist, evaluator.playlist_count, user: user)
      end
    end
  end
end
