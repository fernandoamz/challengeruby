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
  end 
end
