
require 'core/core_helper'

# Feature: Sign up
#   As a visitor
#   I want to sign up
#   So I can access protected areas of the site
describe 'Sign Up', type: :request do
  
let(:valid_attr) {{email: 'testuser@email.com', first_name: 'test', last_name: 'user', password: 'secret123', password_confirmation: 'secret123'}}
  

  # Scenario: Visitor can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password
  #   Then I see a confirm account message
  it 'allows users to sign up with valid email address and password' do
    post 'user', {user: valid_attr, format: :json}
    expect(response.status).to eq(201)
    
    expect(json['email']).to eq('testuser@email.com')
  end

  # Scenario: Visitor cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  it 'users cannot sign up with invalid email address' do
    post 'user', {user: valid_attr.merge(email: 'bogus'), format: :json}
    expect(response.status).to eq(422)
    
    expect(json['errors']['email']).to eq(["is invalid"])
  end

  # Scenario: Visitor cannot sign up without password
  #   Given I am not signed in
  #   When I sign up without a password
  #   Then I see a missing password message
  scenario 'visitor cannot sign up without password' do
    post 'user',  {user: valid_attr.merge(password: nil), format: :json}
    expect(response.status).to eq(422)
    
    expect(json['errors']['password']).to eq(["can't be blank"])
  end

  # Scenario: Visitor cannot sign up with a short password
  #   Given I am not signed in
  #   When I sign up with a short password
  #   Then I see a 'too short password' message
  scenario 'visitor cannot sign up with a short password' do
    post 'user',  {user: valid_attr.merge(password: 'abc', password_confirmation: 'abc'), format: :json}
    expect(response.status).to eq(422)
    
    expect(json['errors']['password']).to eq(["is too short (minimum is 8 characters)"])
  end

  # Scenario: Visitor cannot sign up without password confirmation
  #   Given I am not signed in
  #   When I sign up without a password confirmation
  #   Then I see a missing password confirmation message
  scenario 'visitor cannot sign up without password confirmation' do
    post 'user',  {user: valid_attr.merge(password_confirmation: ''), format: :json}
    expect(response.status).to eq(422)
    
    expect(json['errors']['password_confirmation']).to eq(["doesn't match Password"])
  end

  # Scenario: Visitor cannot sign up with mismatched password and confirmation
  #   Given I am not signed in
  #   When I sign up with a mismatched password confirmation
  #   Then I should see a mismatched password message
  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    post 'user',  {user: valid_attr.merge(password_confirmation: 'mismatch123'), format: :json}
    expect(response.status).to eq(422)
    
    expect(json['errors']['password_confirmation']).to eq(["doesn't match Password"])
  end

end
