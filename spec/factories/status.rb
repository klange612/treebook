FactoryGirl.define do
  factory :status do
    content 'My status not updated'
    user_id 1
  end
end
#let!(:status) { Status.create(content: 'My status not updated', user_id: 1) }
