require 'rails_helper'

describe 'users registration/login' do

	it 'can sign up' do

		visit '/users/sign_up'
		within '.new_user' do 
			fill_in 'Email', with: 'w@will.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
		end
			expect(page).to have_content 'You have signed up successfully'
	end

	it 'can sign in' do
		User.create(email: 'w@will.com', password: '12345678', password_confirmation: '12345678')
		visit '/users/sign_in'
		within '.new_user' do 
			fill_in 'Email', with: 'w@will.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
		end
		expect(page).to have_content 'Signed in successfully'
	end
end