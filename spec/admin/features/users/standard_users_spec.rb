require 'admin/admin_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: Standard user
#   As a standard user
#   When I go to the admin scope
#   Then I get redirected
feature 'Standard users get redirected', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User visits admin/users
  #   Given I am signed in
  #   When I visit users index
  #   Then I see an unauthorized message
  scenario 'user cannot visit users index' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit users_path
    expect(current_path).to eq main_app.root_path
    expect(page).to have_content 'You are not authorized to perform this action.'
  end
  
  # Scenario: User visits admin/users#show
  #   Given I am signed in
  #   When I visit my user id
  #   Then I see an unauthorized message
  scenario 'user cannot visit user show' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(current_path).to eq main_app.root_path
    expect(page).to have_content 'You are not authorized to perform this action.'
  end
  
  # Scenario: User visits admin/users#edit
  #   Given I am signed in
  #   When I visit my user id
  #   Then I see an unauthorized message
  scenario 'user cannot visit user edit' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_path(user)
    expect(current_path).to eq main_app.root_path
    expect(page).to have_content 'You are not authorized to perform this action.'
  end

end
