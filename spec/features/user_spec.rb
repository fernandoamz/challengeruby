require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature "Signing in" do
    it "signs me in" do
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'user[email]', with: 'testing@test.com'
        fill_in 'user[password]', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content '¡Bienvenido!'
    end
  end
end
