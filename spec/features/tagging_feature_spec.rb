require 'rails_helper'

describe 'tagging posts' do 

	let!(:will) do
		User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678')
	end

	before do 
		login_as will
	end

	it 'displayed the tags on the posts page' do 
		visit 'posts/new'
		fill_in 'Title', with: 'My new post'
		fill_in 'Description', with: 'Lorem Ipsum'
		attach_file 'Image', Rails.root.join('spec/images/IMG_1691.jpg')
		fill_in 'Tags', with: 'yolo, swag'
		click_button 'Post it!'

		expect(page).to have_link '#yolo'
		expect(page).to have_link '#swag'
	end

	context 'existing posts' do 

		before do
			will.posts.create title: 'Pic1', tag_names: 'yolo', user: will
			will.posts.create title: 'Pic2', tag_names: 'swag', user: will
			visit '/posts' 
		end

		it 'can filter posts by tag' do	
			click_link '#yolo'
			expect(page).to have_css 'h1', 'posts associated with yolo'
			expect(page).to have_content 'Pic1'
			expect(page).not_to have_content 'Pic2'
		end

	  	it 'uses the tag name in the url' do
		    click_link '#yolo'
		    expect(current_path).to eq '/tags/yolo'
		end
	end
end


