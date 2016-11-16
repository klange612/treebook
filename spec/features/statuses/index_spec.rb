require 'rails_helper'

describe 'statuses index page ' do

# FactoryGirl spec/factories/status.rb
  before(:each) do
    @user = create(:hotty)
    @status = create(:status)
  end

  it 'has title statuses' do
    set_page
    within('h1') do
      expect(page).to have_content('Statuses')
    end
  end

  it "has a status of 'My status not updated'" do
    set_page
    expect(page).to have_content('My status not updated')
  end

  def set_page
    visit '/statuses'
  end
end
