require 'core/core_helper'

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User authentication
#   As a user
#   I want to access the api
#   So I can see my resources
describe 'authentication', type: :request do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Access denied without token and email
  #   Given I dont include email and token
  #   When I visit the user index page
  #   Then I get an unauthorized response
  it 'does not allow requests without email or token' do
    user = FactoryGirl.create(:user)
    get "user",:format =>:json

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("You need to sign in or sign up before continuing.")
  end
  

  # Scenario: Access denied with invalid token
  #   Given I include my email and someone elses token
  #   When I visit the user index page
  #   Then I get an unauthorized response
  it 'does not allow requests without email' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    get "user?core\/user_email=#{me.email}&core\/user_token=#{other.authentication_token}",:format =>:json

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end
  
  # Scenario: Access denied with invalid email
  #   Given I include my token and someone elses email
  #   When I visit the user index page
  #   Then I get an unauthorized response
  it 'does not allow requests without token' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    get "user?core\/user_email=#{other.email}&core\/user_token=#{me.authentication_token}",:format =>:json

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end
  
  
  # Scenario: Access denied with invalid email in header
  #   Given I include my token and someone elses email in header
  #   When I visit the user index page
  #   Then I get an unauthorized response
  it 'does not allow requests with invalid token in header' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    headers = {:'X-User-Email' => other.email, :'X-User-Token' => me.authentication_token}
    get "user",{:format =>:json}, **headers

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end
  
  # Scenario: Access denied with invalid token in header
  #   Given I include my email and someone elses token in header
  #   When I visit the user index page
  #   Then I get an unauthorized response
  it 'does not allow requests with invalid token in header' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    headers = {:'X-User-Email' => me.email, :'X-User-Token' => other.authentication_token}
    get "user",{:format =>:json}, **headers

    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end
  
  
  # Scenario: Allows access with token and email
  #   Given I include email and token
  #   When I visit the user index page
  #   Then I get a list of users
  it 'Allows requests with email and token' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    get "user?core\/user_email=#{me.email}&core\/user_token=#{me.authentication_token}",:format =>:json
    expect(response.status).to eq(200)
    
    expect(json[:email]).to eq(me.email)
  end
  
  # Scenario: Allows access with token and email in header
  #   Given I include email and token in the header
  #   When I visit the user index page
  #   Then I get a list of users
  it 'Allows requests with email and token in header' do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)
    headers = {:'X-User-Email' => me.email, :'X-User-Token' => me.authentication_token}
    
    get "user",{:format =>:json}, **headers
    expect(response.status).to eq(200)
    
    expect(json[:email]).to eq(me.email)
  end
  

end
