require 'rails_helper'

describe 'posts listing page' do 
	
	context 'no posts' do 

		it 'displays a prompt to create posts' do 
			visit '/posts'

			expect(page).to have_link 'New post'
		end
		
		it 'tells me that there are no posts' do 
			visit '/posts'
			expect(page).to have_content 'No posts yet'
		end
	end

	context 'with posts' do 
		before do
			will = User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678') 
			will.posts.create(title: 'Happy', description: 'Photo of happy kids')
		end
		it 'should show the post' do 
			visit '/posts'
			expect(page).to have_content 'Happy'
			expect(page).to have_content 'Photo of happy kids'
		end
	end
end

describe 'creating posts' do

	context 'when logged out' do 
		it 'is impossible' do 
			visit '/posts'
			click_link 'New post'
			expect(page).to have_content 'Sign in'
			expect(page).not_to have_field 'Title'
		end
	end

	context 'logged in'	do 

		before do 
			will = User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678')
			login_as will
		end

		it 'adds the post to the homepage' do
			visit '/posts/new'
		    fill_in 'Title', with: 'My new post'
		    fill_in 'Description', with: 'Lorem ipsum'
		    fill_in 'Address', with: '25 City Road, London'
		    click_button 'Post it!'

		    expect(current_path).to eq posts_path
		    expect(page).to have_content 'My new post'
		    expect(page).to have_content 'Posted by: w@will.com'
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

		it 'can add an amount to a post' do 
		    visit '/posts/new'
		    fill_in 'Title', with: 'My new post'
		    fill_in 'Description', with: 'Lorem ipsum'
		    fill_in 'Address', with: '25 City Road, London'
		    attach_file 'Image', Rails.root.join('spec/images/IMG_1691.jpg')
		    fill_in 'Amount', with: '20.00'

		    click_button 'Post it!'

		    expect(current_path).to eq posts_path
		    expect(page).to have_content '$20.00'
		end

		# it 'can add an address to our posts' do
		#     visit '/posts/new'
		#     fill_in 'Title', with: 'My new post'
		#     fill_in 'Description', with: 'Lorem ipsum'
		#     attach_file 'Image', Rails.root.join('spec/images/IMG_1691.jpg')
		#     fill_in 'Tags', with: 'yolo, swag'
		#     fill_in 'Address', with: '25 City Road, London'

		#     click_button 'Post it!'

		#     expect(page).to have_content '25 City Road, London'

		# end
	end
end