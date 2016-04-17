def sign_up(email, password)
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def post
  visit '/posts'
  click_link 'Add new post'
  fill_in 'Caption', with: 'Summer 2k16'
  click_button 'Create Post'
end
