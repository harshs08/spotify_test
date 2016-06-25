require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "model validations" do

    it { is_expected.to validate_uniqueness_of(:uid) }
    it { is_expected.to have_many(:playlists) }
  end

  context "refresh the token", cassette_name: "_request_token" do

    describe "#refresh!" do
      let(:access_token) { "BQD3KfPFwYTHEDqdXkPTfBOHayfBjPmdLBt8FsAoqna9cXR378h0xmPbIi7SP83aSoJYgXoM6kjPZhSP18HOMwVaFEqqHnNC9P3f7QRiGgLejFGX2BSPqGKi8UTl6atdgf8xkzQtgi4N-NOxWQKNDy0zwVGfvdQe9K2uDv7kvPEM0v8"} 
      subject { user.refresh! }

      it "fetches the access_token from spotify" do
        expect(user.access_token).to eq access_token
      end
    end
  end
  
  context "get the playlist from spotify and populate the playlists database", cassette_name: "_add_playlists" do
    subject { user.add_playlists }

    describe "#add_playlists" do
      it "creates users playlist" do
        expect {
          subject
        }.to change{ user.users_playlists.count }.by(8)
      end
    end
  end
end
