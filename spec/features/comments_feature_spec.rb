require 'rails_helper'

feature 'comments' do
  context 'Add comment' do
    before do
      Post.create(caption: 'Omg look at da beach')
    end

    scenario 'user can add a comment' do
      visit '/posts'
      click_link 'Comment'
      fill_in 'Comment', with: 'Dat beach look g8'
      click_button 'Post'
      expect(page).to have_content 'Dat beach look g8'
    end
  end
end
