require 'rails_helper'

describe 'orders page' do
  	let(:post){Post.create title: 'Pretty Picture'}
  	let(:user){User.create email: 'customer@blah.com', password: '12345678', password_confirmation: '12345678'}
  	let(:admin){Admin.create email: 't@t.com', password: '12345678', password_confirmation: '12345678'}

  	context 'logged in as admin' do

      before do
        login_as admin, scope: :admin
      end

      context 'no orders' do
    		it 'sees a message' do
	        visit '/orders'
	        expect(page).to have_content 'No orders yet'
    		end 
      end

      context 'with orders' do
        before do 
          christmas_day = Date.new(2013, 12, 25)

          Order.create(id: 1, post: post, user: user, created_at: christmas_day)
          visit '/orders'
        end

        it 'displays the product' do
          expect(page).to have_link 'Pretty Picture'
        end

        it 'displays the customer email' do
          expect(page).to have_content 'customer@blah.com'
        end

        it 'displays an order number' do
          expect(page).to have_content '1312250001'
        end
      end
    end 

  	context 'not logged in as admin' do
    	it 'prompts to sign in' do
      		visit '/orders'
    		expect(page).to have_content 'sign up'
    	end
	end
end
