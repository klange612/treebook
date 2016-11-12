require 'rails_helper'

describe 'statuses index page ' do
  let!(:status) { Status.create(content: 'My status') }

  it 'has title statuses' do
    set_page
    within('h1') do
      expect(page).to have_content('Statuses')
    end
  end

  it "has a status of 'My Status'" do
    set_page
    expect(page).to have_content('My status')
  end

  def set_page
    visit '/statuses'
  end
end
