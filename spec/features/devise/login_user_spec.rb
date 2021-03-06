require 'rails_helper'

describe 'user login should ' do
  before(:each) do
    @user = create(:hotty)
  end

  it ' login with correct username and password' do
    visit 'users/sign_in'
    signin_user
    expect(page).to have_content('Signed in successfully')
  end

  it ' login to path /login with correct username and password' do
    visit '/login'
    signin_user
    expect(page).to have_content('Signed in successfully')
  end

  it ' /logout should log user out' do
    visit '/login'
    signin_user
    visit '/logout'
    expect(page).to have_content('Signed out successfully')
  end

  it ' fail to log in with incorrect user email' do
    visit 'users/sign_in'
    fill_in 'user_email', with: 'bob@b.com'
    fill_in 'user_password', with: @user.password
    click_button('Sign in')
    expect(page).to have_content('Invalid Email or password')
  end

  it ' fail to log in with incorrect password' do
    visit 'users/sign_in'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'wrong_pass'
    click_button('Sign in')
    expect(page).to have_content('Invalid Email or password')
  end

  def signin_user
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button('Sign in')
  end
end
