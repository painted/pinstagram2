require 'rails_helper'

describe 'tagging posts' do 
	before do 
		will = User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678')
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
end
