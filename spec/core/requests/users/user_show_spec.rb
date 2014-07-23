require 'core/core_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
describe 'describe user show', type: :request do
  before :each do
    @user = FactoryGirl.create(:user)
    @headers = {'X-User-Email' => @user.email, 'X-User-Token' => @user.authentication_token}
  end
  
  after(:each) do
    Warden.test_reset!
  end
  
  # Scenario: User profile json
  #   Given I have valid credentials
  #   When I visit my user account
  #   Then I can see my own data
  it 'allows users to see themselves' do
    get "user", {format: :json}, @headers

    expect(response.status).to eq(200)
    expect(json['email']).to eq(@user.email)
  end


end