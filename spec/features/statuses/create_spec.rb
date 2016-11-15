require 'rails_helper'

describe 'creating or editing status should ' do
  before(:each) do
    @user = create(:hotty)     # FactoryGirl spec/factories/user.rb
    @status = create(:status) # FactoryGirl spec/factories/status.rb
  end

  let!(:status) { Status.create(content: 'My status not updated', user_id: 1) }

  it ' add a status when creating a valid status' do
    signin
    visit '/new'
    fill_in 'status_content', with: 'My current status is'
    click_button 'Create Status'
    expect(page).to have_content('My current status is')
    expect(page).to have_content('Status was successfully created')
    visit '/statuses'
    expect(page).to have_content('My current status is')
    expect(page).to have_content('hotty')
  end

  it ' error when invalid content creating' do
    signin
    visit '/new'
    fill_in 'status_content', with: 'xx'
    click_button 'Create Status'
    expect(page).to have_content('Content is too short')
    visit '/statuses'
    expect(page).not_to have_content('xx')
  end

  it ' error when trying to create new status not logged in' do
    visit '/new'
    expect(page).not_to have_content("New Status")
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  it ' edit a status when editing with valid content' do
    signin
    visit '/statuses/1/edit'
    expect(page).to have_content('Edit Status')
    fill_in 'status_content', with: 'My status updated now'
    click_button 'Update Status'
    expect(page).to have_content('Status was successfully updated')
    expect(page).to have_content('My status updated now')
  end

  it ' error when invalid content editing' do
    signin
    visit '/statuses/1/edit'
    expect(page).to have_content('Edit Status')
    fill_in 'status_content', with: 'xx'
    click_button 'Update Status'
    expect(page).to have_content('Content is too short')
    visit '/statuses'
    expect(page).to have_content('My status not updated')
  end

  it ' error when trying to edit status not logged in' do
    visit '/statuses/1/edit'
    expect(page).not_to have_content("Edit Status")
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  def signin
    visit '/login'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'
  end
end
