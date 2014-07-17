require 'rails_helper'

describe 'maps' do 

	context 'posts with addresses' do 
		before do
			will = User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678') 
			will.posts.create(title: 'Happy', description: 'Photo of happy kids', address: '25 City Road, London')
		end

		it 'displays a map', js: true do 
			visit '/posts'
			click_link 'Map' 
			expect(page).to have_map
			# expect(page).to have_css '.gm-style'
		end
	end
end