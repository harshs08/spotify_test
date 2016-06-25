require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe "model validations" do
    it { is_expected.to validate_uniqueness_of(:pid) }
    it { is_expected.to have_many(:users)}
  end
end
