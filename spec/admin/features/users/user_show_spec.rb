require 'admin/admin_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end


  # Scenario: Admin can see another user's profile
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I see the user's details
  scenario "admin can see another user's profile" do
    me = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    login_as(me, :scope => :user)
    visit user_path(other)
    expect(page).to have_content other.email
  end

end
