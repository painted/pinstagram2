require 'rails_helper'

describe 'posts listing page' do 
	
	context 'no posts' do 
		it 'tells me that there are no posts' do 
			visit '/posts'
			expect(page).to have_content 'No posts yet'
		end
	end

	context 'with posts' do 
		before do 
			Post.create(title: 'Happy', description: 'Photo of happy kids')
		end
		it 'should show the post' do 
			visit '/posts'
			expect(page).to have_content 'Happy'
			expect(page).to have_content 'Photo of happy kids'
		end
	end
end

describe 'creating posts' do
  it 'adds the post to the homepage' do
    visit '/posts/new'
    fill_in 'Title', with: 'My new post'
    fill_in 'Description', with: 'Lorem ipsum'
    click_button 'Post it!'

    expect(current_path).to eq posts_path
    expect(page).to have_content 'My new post'
    expect(page).not_to have_css 'img.uploaded-pic'
  end

  it 'can add a photo to our posts' do
    visit '/posts/new'
    fill_in 'Title', with: 'My new post'
    fill_in 'Description', with: 'Lorem ipsum'
    attach_file 'Image', Rails.root.join('spec/images/IMG_1691.jpg')

    click_button 'Post it!'

    expect(current_path).to eq posts_path
    expect(page).to have_css 'img.uploaded-pic'
  end
end