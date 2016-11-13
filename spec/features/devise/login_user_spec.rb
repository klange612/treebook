require 'rails_helper'

describe 'user login should ' do
  let!(:user) { User.create(first_name: "John", last_name: "Doe", profile_name: "jdoe",
            email: 'john@a.com', password: 'password', password_confirmation: 'password') }

  it ' login with correct username and password' do
    visit 'users/sign_in'
    fill_in('user_email', with: 'john@a.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Signed in successfully')
  end

  it ' login to path /login with correct username and password' do
    visit '/login'
    fill_in('user_email', with: 'john@a.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Signed in successfully')
  end

  it ' /logout should log user out' do
    visit '/login'
    fill_in('user_email', with: 'john@a.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    visit '/logout'
    expect(page).to have_content('Signed out successfully')
  end

  it ' fail to log in with incorrect username' do
    visit 'users/sign_in'
    fill_in('user_email', with: 'bob@b.com')
    fill_in('user_password', with: 'password')
    click_button('Sign in')
    expect(page).to have_content('Invalid Email or password')
  end

  it ' fail to log in with incorrect password' do
    visit 'users/sign_in'
    fill_in('user_email', with: 'john@a.com')
    fill_in('user_password', with: 'wrong_pass')
    click_button('Sign in')
    expect(page).to have_content('Invalid Email or password')
  end
end
