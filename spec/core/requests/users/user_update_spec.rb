require 'core/core_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User updates
#   As a user
#   I want to update my profile
#   So it has correct information
describe 'User updates', :type => :request do
  before :each do
    @user = FactoryGirl.create(:user)
    @headers = {'X-User-Email' => @user.email, 'X-User-Token' => @user.authentication_token}
  end
  
  after(:each) do
    Warden.test_reset!
  end
  
  # Scenario: User changes first_name
  #   Given I have valid credntials
  #   When I change my first name
  #   Then I see my new details
  it 'allows users to change their first name' do
    put "user", {user: {first_name: 'Kimberly'}, format: :json}, @headers

    expect(response.status).to eq(204)
    @user.reload
    expect(@user.first_name).to eq('Kimberly')  
  end
  
  # Scenario: User fails validation
  #   Given I have valid credntials
  #   When I change name to something invalid
  #   Then I see an error message
  it 'returns and error on failed validation' do
    put "user", {user: {first_name: ' '}, format: :json}, @headers
  
    expect(response.status).to eq(422)
    
    expect(json['errors']).to_not be_empty  
    @user.reload
    expect(@user.first_name).to_not eq('Kimberly')  
  end


end
