require 'core/core_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User deletes
#   As a user
#   I want to delete myself
#   So I no longer have an account
describe 'User deletes', :type => :request do
  before :each do
    @user = FactoryGirl.create(:user)
    @headers = {'X-User-Email' => @user.email, 'X-User-Token' => @user.authentication_token}
  end
  
  after(:each) do
    Warden.test_reset!
  end
  
  # Scenario: User deletes himself
  #   Given I have valid credntials
  #   When I delete myself
  #   Then I can no longer access my account
  it 'allows users to cancel their account' do
    delete "user", {format: :json}, @headers
  
    expect(response.status).to eq(204)
    
    expect(Core::User.where(id: @user.id)).to be_empty
    
    get "user", {format: :json}, @headers
    expect(response.status).to eq(401)

    expect(json['error']).to eq('Invalid email or password.')
  end

end
