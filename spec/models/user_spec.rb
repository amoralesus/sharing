require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:full_name) }

  it {should have_many(:projects) }

  context "Following" do
    let(:user) { Fabricate(:user) }
    let(:other_user) { Fabricate(:user) }

    before do
      user.follow(other_user)
    end

    it "should follow another user" do
      expect(other_user.followers).to include(user)
    end

    it "should show users that I follow" do
      expect(user.following).to include(other_user)
    end
  end
end
