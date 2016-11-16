require 'rails_helper'
#
# RSpec.describe "profiles/show.html.erb", type: :view do
#   it " page to have header Profiles#show" do
#     expect(page).to have_content("Profiles#show")
#   end
# end
describe 'profiles controller should ' do
  before(:each) do
    @user = create(:hotty)
    @status = create(:status)
  end

  it 'go to profile name url and show profile name' do
    visit '/hotty'
    expect(page).to have_content(@user.profile_name)
  end

  it 'have a status' do
    @status = create(:status)
    visit '/hotty'
    expect(page).to have_content('My status not updated')
  end
end
