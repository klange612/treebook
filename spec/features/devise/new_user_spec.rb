require 'rails_helper'

describe 'new user registration' do
  let!(:user) { User.create(first_name: 'John', last_name: 'Doe', profile_name: 'JDoe',
              email: 'john@a.com', password: 'Password', password_confirmation: 'Password') }

  it 'should add a user' do
    set_page
    expect(page).to have_content('Sign up')
    fill_in('user_first_name', with: 'Prof')
    fill_in('user_last_name', with: 'Name')
    fill_in('user_profile_name', with: 'ProfName')
    fill_in('user_email', with: 'a@a.com')
    fill_in('user_password', with: 'Password')
    fill_in('user_password_confirmation', with: 'Password')
    click_button('Sign up')
    expect(page).to have_content('You have signed up successfully')
  end

  it 'should add a user at /register' do
    visit '/register'
    expect(page).to have_content('Sign up')
    fill_in('user_first_name', with: 'Prof')
    fill_in('user_last_name', with: 'Name')
    fill_in('user_profile_name', with: 'ProfName')
    fill_in('user_email', with: 'a@a.com')
    fill_in('user_password', with: 'Password')
    fill_in('user_password_confirmation', with: 'Password')
    click_button('Sign up')
    expect(page).to have_content('You have signed up successfully')
  end

  it 'should fail on duplicate email' do
    set_page
    fill_in('user_first_name', with: 'Bill')
    fill_in('user_last_name', with: 'Smith')
    fill_in('user_profile_name', with: 'Billy')
    fill_in('user_email', with: 'john@a.com')
    fill_in('user_password', with: 'Password')
    fill_in('user_password_confirmation', with: 'Password')
    click_button('Sign up')
    expect(page).to have_content('Email has already been taken')
  end

  it 'should fail password confirm if do not match' do
    set_page
    fill_in('user_first_name', with: 'Bill')
    fill_in('user_last_name', with: 'Smith')
    fill_in('user_profile_name', with: 'Billy')
    fill_in('user_email', with: 'bill@a.com')
    fill_in('user_password', with: 'Password')
    fill_in('user_password_confirmation', with: 'x')
    click_button('Sign up')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it ' should fail if profile name is not unique' do
    set_page
    fill_in('user_first_name', with: 'Bill')
    fill_in('user_last_name', with: 'Smith')
    fill_in('user_profile_name', with: 'JDoe')
    fill_in('user_email', with: 'bill@a.com')
    fill_in('user_password', with: 'Password')
    fill_in('user_password_confirmation', with: 'x')
    click_button('Sign up')
    expect(page).to have_content('Profile name has already been taken')
  end

  def set_page
    visit('/users/sign_up')
  end
end
