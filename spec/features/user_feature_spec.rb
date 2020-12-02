require 'rails_helper'

feature 'User authentication' do
  #user sign up
  scenario 'with valid data' do
    visit new_user_registration_path

    fill_in 'Email', with: 'username@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text 'Welcome! You have signed up successfully.'
    expect(page).to have_link 'Sign Out'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid data' do
    visit new_user_registration_path
    click_button 'Sign up'

    expect(page).to have_text "Email can't be blank"
    expect(page).to have_text "Password can't be blank"
    expect(page).to have_no_link 'Sign Out'
  end

  #user sign in
  scenario 'with valid credentials' do
    user = create :user

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_link 'Sign Out'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid credentials' do
    user = build :user

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Sign Out'
  end

  #user sign out
  scenario 'user signed in' do
    user = create :user

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit root_path
    click_link 'Sign Out'

    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_no_link 'Sign Out'
    expect(page).to have_current_path root_path
  end

  #user reset password
  # scenario 'user enters a valid email' do
  #   user = create :user

  #   visit new_user_password_path

  #   fill_in 'Email', with: user.email
  #   click_button 'Send me reset password instructions'

  #   expect(page).to have_text 'You will receive an email with instructions'
  #   expect(page).to have_current_path new_user_session_path
  # end

  # scenario 'user enters an invalid email' do
  #   visit new_user_password_path

  #   fill_in 'Email', with: 'username@example.com'
  #   click_button 'Send me reset password instructions'

  #   expect(page).to have_text 'Email not found'
  # end

  # scenario 'user changes password' do
  #   token = create(:user).send_reset_password_instructions

  #   visit edit_user_password_path(reset_password_token: token)

  #   fill_in 'New password', with: 'p4ssw0rd'
  #   fill_in 'Confirm new password', with: 'p4ssw0rd'
  #   click_button 'Change my password'

  #   expect(page).to have_text 'Your password has been changed successfully.'
  #   expect(page).to have_current_path root_path
  # end

  # scenario 'password reset token is invalid' do
  #   visit edit_user_password_path(reset_password_token: 'token')

  #   fill_in 'New password', with: 'p4ssw0rd'
  #   fill_in 'Confirm new password', with: 'p4ssw0rd'
  #   click_button 'Change my password'

  #   expect(page).to have_text 'Reset password token is invalid'
  # end
end