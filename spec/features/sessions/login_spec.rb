require 'rails_helper'

RSpec.describe 'User login' do
    describe 'happy path' do
        it 'allows users to login' do
            user = User.create(email: "funbucket13@example.com", password: "test")

            visit root_path

            click_link 'Sign In'

            expect(current_path).to eq(sign_in_path)

            fill_in :email, with: user.email
            fill_in :password, with: user.password

            click_button 'Sign In'

            expect(current_path).to eq(root_path)
            expect(page).to have_content("Welcome, #{user.email}")
        end
    end

    describe 'sad path' do
        it 'block login if bad credentials' do
            user = User.create(email: "funbucket13@example.com", password: "test")

            visit root_path

            click_link 'Sign In'

            expect(current_path).to eq(sign_in_path)

            fill_in :email, with: user.email
            fill_in :password, with: 'bad password'

            click_button 'Sign In'

            expect(page).to have_content("Your credentials are bad, and you should feel bad")
        end
    end
end