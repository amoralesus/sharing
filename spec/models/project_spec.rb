require 'spec_helper'

describe Project do
  it { should validate_presence_of(:name) }

  it {should belong_to(:user) }

  context "Sharing a project" do
    let(:user1) { Fabricate(:user) }
    let(:user2) { Fabricate(:user) }
    let(:project) { Fabricate(:project, :user => user1) }

    it "with another user, makes the projects visible to the user" do
      project.share_with(user2)
      expect(user2.shared_projects).to include(project)
    end

    it "shows all available projects, belonging to user and shared with user" do
      project.share_with(user2)
      project2 = Fabricate(:project, :user => user2)
      expect(user2.visible_projects.to_a).to eq([project2, project])
    end
  end
end
