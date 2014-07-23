require 'admin/admin_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User edit
#   As a user
#   I want to edit my user profile
#   So I can change my email address
feature 'User edit', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User changes email address
  #   Given I am signed in
  #   When I change my email address
  #   Then I see an account updated message
  scenario 'admin changes email address' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    fill_in 'Email', :with => 'newemail@example.com'
    click_button 'Update'
    expect(page).to have_content 'User was successfully updated'
    user.reload
    expect(user.email).to eq 'newemail@example.com'
  end

  # Scenario: User cannot edit another user's profile
  #   Given I am signed in
  #   When I try to edit another user's profile
  #   Then I see my own 'edit profile' page
  scenario "admin can edit another user's profile", :me do
    me = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    login_as(me, :scope => :user)
    visit edit_user_path(other)
    fill_in 'Email', :with => 'newemail@example.com'
    click_button 'Update'
    expect(page).to have_content 'User was successfully updated'
    other.reload
    expect(other.email).to eq 'newemail@example.com'
  end

end
