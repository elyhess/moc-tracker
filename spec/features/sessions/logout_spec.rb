require 'rails_helper'

RSpec.describe 'User logout' do
	it 'allows users to logout' do
		@user = User.create(email: "funbucket13@example.com", password: "test")

		visit root_path

		click_link 'Sign In'

		expect(current_path).to eq(sign_in_path)

		fill_in :email, with: @user.email
		fill_in :password, with: @user.password

		click_button "Log In"

		expect(current_path).to eq(root_path)

		click_link "Logout"

		expect(page).to have_content("You have been successfully signed out.")
	end
end

