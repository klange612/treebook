require 'rails_helper'

describe 'statuses index page ' do
  before(:each) { @status = create(:status) } # FactoryGirl spec/factories/status.rb

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
