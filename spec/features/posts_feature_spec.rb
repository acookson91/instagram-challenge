require 'rails_helper'

feature 'posts' do

  context 'No posts have been added' do
    scenario 'should display a link to add new post' do
      visit '/posts'
      expect(page).to have_link('Add new post')
      expect(page).to have_content('No posts available')
    end
  end

  context 'Post created' do
    before do
      Post.create(caption: 'Summer 2k16')
    end

    scenario 'post should show' do
      visit '/posts'
      expect(page).to have_link('Add new post')
      expect(page).not_to have_content('No posts available')
    end

    scenario 'user can add a new post' do
      visit '/posts'
      click_link 'Add new post'
      fill_in 'Caption', with: 'Winter 2k16'
      click_button 'Create Post'
      expect(page).to have_content('Winter 2k16')
    end
  end

  context 'Update Post' do
    before do
      Post.create(caption: 'Summer 2k16')
    end

    scenario 'user can update posts' do
      visit '/posts'
      click_link 'Edit post'
      fill_in 'Caption', with: 'Winter 2k16'
      click_button 'Update Post'
      expect(page).to have_content 'Winter 2k16'
      expect(page).not_to have_content 'Summer 2k16'
    end
  end

  context 'Delete Post' do
    before do
      Post.create(caption: 'Summer 2k16')
    end

    scenario 'user can delete post' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content 'Summer 2k16'
      expect(page).to have_content 'Post deleted'
    end
  end


end
