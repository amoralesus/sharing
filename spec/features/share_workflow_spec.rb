require 'spec_helper'

feature "Sharing projects" do
  given(:user) { Fabricate(:user) }
  given(:other_user) { Fabricate(:user) }
  given(:project) { Fabricate(:project, :user => user) }
  given(:other_user_project) { Fabricate(:project, :user => other_user) }

  background do
    user
    other_user
    project
    other_user_project
  end

  scenario "A user shares a project with another user", :js => true do
    sign_in_user(user)
    visit project_path(project)
    select "#{other_user.full_name}", :from => "user_id" 
    click_button 'Share'
    expect(page).to have_content(other_user.full_name)
  end
end
