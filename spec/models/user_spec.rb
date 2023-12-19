require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
     # Test for presence of password and password_confirmation and their match
     it 'validates presence of password and password_confirmation and their match' do
      user = User.new(
        first_name: 'Jo',
        last_name: 'Doe',
        email: 'jo@example.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user).to be_valid

      user.password_confirmation = 'different_password'
      expect(user).to_not be_valid
    end
    # Test for password and password_confirmation
    it 'does not save without a password and password_confirmation' do
      user = User.new(
        first_name: 'Jo',
        last_name: 'Doe',
        email: 'jo@example.com',
        password: nil,
        password_confirmation: nil
      ) 
      expect(user).to_not be_valid
    end

    # Test for email uniqueness
    it 'validates uniqueness of email' do
      User.create(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'test@example.com',
        password: '123',
        password_confirmation: '123'
      )
      user_with_duplicate_email = User.new(
        first_name: 'Janet',
        last_name: 'Doe',
        email: 'TEST@example.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user_with_duplicate_email).to_not be_valid
    end

    # Test for presence of email, first name, and last name
    it 'validates presence of email, first name, and last name' do
      user = User.new(
        email: nil,
        first_name: nil,
        last_name: nil,
        password: '123',
        password_confirmation: '123'
      )
      expect(user).to_not be_valid
    end

  end

end

