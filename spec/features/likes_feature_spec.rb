require 'rails_helper'

feature 'endorsing reviews' do
  before do
    Post.create(caption: 'Summer 2k16')
  end

  scenario 'a user can like posts, which updates the like count', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
