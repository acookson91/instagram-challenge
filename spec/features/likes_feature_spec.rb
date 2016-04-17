require 'rails_helper'

feature 'endorsing reviews' do
  before do
    Post.create(caption: 'Summer 2k16')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/'
    click_link 'Like' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 like')
  end

end
