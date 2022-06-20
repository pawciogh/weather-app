require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
 
    it 'ensures email presence' do
      user = User.new(password: 'password', password_confirmation: 'password').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(email: 'email@email.com').save
      expect(user).to eq(false)
    end

    it 'ensures password confirmation works' do
      user = User.new(email: 'email@email.com', password: 'password', password_confirmation: 'different_password').save
      expect(user).to eq(false)
    end

    it 'saves successfully' do
      user = User.new(email: 'email@email.com', password: 'password', password_confirmation: 'password').save
      expect(user).to eq(true)
    end
  
  end

 
end
