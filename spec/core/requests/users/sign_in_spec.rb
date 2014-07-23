require 'core/core_helper'

# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
describe 'Sign in', type: :request do

  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  it 'does not let user sign in if not registered' do
    get "user",{:format =>:json}, basic_auth('bogus@email.com', 'secret123')
    
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end
  
  # Scenario: Confirmed user can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see myself as json
  it 'Allows requests with email and token in header' do
    me = FactoryGirl.create(:user)
    get "user",{:format =>:json}, basic_auth(me.email, me.password)
    
    expect(response.status).to eq(200)
    expect(json[:authentication_token]).to eq(me.authentication_token)
  end
  


  # Scenario: Unconfirmed user cannot sign in with valid credentials
  #   Given I exist as an unconfirmed user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a confimation error
   it 'does not allow unconfirmed user to sign in with valid credentials' do
    me = FactoryGirl.create(:user, :unconfirmed)
    get "user",{:format =>:json}, basic_auth(me.email, me.password)
    
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("You have to confirm your account before continuing.")
  end


  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  it 'does not let user sign in with wrong email' do
    me = FactoryGirl.create(:user)
    get "user",{:format =>:json}, basic_auth('invalid_email@email.com', me.password)
    
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  it 'does not  cannot sign in with wrong password' do
    me = FactoryGirl.create(:user)
    get "user",{:format =>:json}, basic_auth(me.email, 'invalid')
    
    expect(response.status).to eq(401)
    expect(json[:error]).to eq("Invalid email or password.")
  end

end
