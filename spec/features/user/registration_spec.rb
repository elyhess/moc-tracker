require 'rails_helper'

RSpec.describe 'User Registration' do 
    describe 'happy path' do
        it 'allows a user to register' do
            visit root_path

            click_link 'Sign Up'

            expect(current_path).to eq(new_user_path)

            email = 'timtheskier@example.com'
            password = 'frankie'

            fill_in :user_email, with: email
            fill_in :user_password, with: password
            fill_in :user_password_confirmation, with: password

            click_button 'Get Started'

            expect(current_path).to eq(root_path)
            expect(page).to have_content("Welcome, #{email}")
        end
    end
end