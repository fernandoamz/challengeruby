# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email precense' do
      user = User.new(password: 'testing').save
      expect(user).to eq(false)
    end

    it 'password precense' do
      user = User.new(email: 'testing@test.com').save
      expect(user).to eq(false)
    end

    it 'is databse authenticable' do
      user = User.create(
         email: 'test@example.com', 
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user.valid_password?('password123')).to be_truthy
    end
  end
end
