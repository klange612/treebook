require 'rails_helper'

describe 'creating or editing status should ' do
  let!(:user) { User.create(first_name: 'John', last_name: 'Doe', profile_name: 'JDoe',
              email: 'jdoe@a.com', password: 'password', password_confirmation: 'password') }
  let!(:status) { Status.create(content: 'My status not updated', user_id: 1) }

  it ' add a status when creating a valid status' do
    visit '/login'
    fill_in 'user_email', with: 'john@a.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
    visit '/new'
    fill_in 'status_content', with: 'My current status is'
    click_button 'Create Status'
    expect(page).to have_content('My current status is')
    expect(page).to have_content('Status was successfully created')
    visit '/statuses'
    expect(page).to have_content('My current status is')
  end

  it ' error when invalid content creating' do
    visit '/login'
    fill_in 'user_email', with: 'john@a.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
    visit '/new'
    fill_in 'status_content', with: 'xx'
    click_button 'Create Status'
    expect(page).to have_content('Content is too short')
    visit '/statuses'
    expect(page).not_to have_content('xx')
  end

  it ' edit a status when editing with valid content' do
    visit '/login'
    fill_in 'user_email', with: 'john@a.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
    visit '/statuses/1/edit'
    expect(page).to have_content('Edit Status')
    fill_in 'status_content', with: 'My status updated now'
    click_button 'Update Status'
    expect(page).to have_content('Status was successfully updated')
    expect(page).to have_content('My status updated now')
  end

  it ' error when invalid content editing' do
    visit '/login'
    fill_in 'user_email', with: 'john@a.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
    visit '/statuses/1/edit'
    expect(page).to have_content('Edit Status')
    fill_in 'status_content', with: 'xx'
    click_button 'Update Status'
    expect(page).to have_content('Content is too short')
    visit '/statuses'
    expect(page).to have_content('My status not updated')
  end

  def page_new
    visit '/new'
  end
end
