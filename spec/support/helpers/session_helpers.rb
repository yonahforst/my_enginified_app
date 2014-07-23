module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation, first_name = 'Test', last_name = 'User')
      visit core.new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'First name', with: first_name
      fill_in 'Last name', with: last_name
      fill_in 'Password', with: password, :match => :prefer_exact
      fill_in 'Password confirmation', :with => confirmation, :match => :prefer_exact
      click_button 'Sign up'
    end

    def signin(email, password)
      visit core.new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
