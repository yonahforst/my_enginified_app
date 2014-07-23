require 'admin/admin_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a admin
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   Then I see all user emails
  scenario 'admin sees all users' do
    me = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    one_more = FactoryGirl.create(:user, email: 'even_one_more@example.com')
    login_as(me, :scope => :user)
    visit users_path
    expect(page).to have_content other.email
    expect(page).to have_content one_more.email
  end

end
