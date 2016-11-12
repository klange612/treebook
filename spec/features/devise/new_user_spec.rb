require 'rails_helper'

describe "new user registration" do
  let!(:user) { User.create(first_name: "John", last_name: "Doe", profile_name: "JDoe",
              email: "john@a.com", password: "Password", password_confirmation: "Password") }

  it "should add a user" do
    visit('/statuses')
    click_link 'Sign up'
    expect(page).to have_content('Sign up')
    fill_in('user_first_name', with: "John")
    fill_in('user_last_name', with: "Doe")
    fill_in('user_profile_name', with: "ProfName")
    fill_in('user_email', with: "a@a.com")
    fill_in('user_password', with: "Password")
    fill_in('user_password_confirmation', with: "Password")
    click_button('Sign up')
    expect(page).to have_content('You have signed up successfully')
  end

  it "should fail on duplicate email" do
    set_page
    fill_in('user_email', with: "john@a.com")
    fill_in('user_password', with: "Password")
    fill_in('user_password_confirmation', with: "Password")
    click_button('Sign up')
    expect(page).to have_content("Email has already been taken")
  end

  it "should fail password confirm if don't match" do
    set_page
    fill_in('user_email', with: "bill@a.com")
    fill_in('user_password', with: "Password")
    fill_in('user_password_confirmation', with: "x")
    click_button('Sign up')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  def set_page
    visit('/users/sign_up')
  end
end