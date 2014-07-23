require 'admin/admin_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'User delete', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Admin can delete other user
  #   Given I am signed in
  #   When I delete a user
  #   Then I should see a user deleted message
  scenario 'admin can delete other users' do
    # skip 'skip a slow test'
    me = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    login_as(me, :scope => :user)
    visit user_path(other)
    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'User was successfully destroyed.'
  end
  

end




