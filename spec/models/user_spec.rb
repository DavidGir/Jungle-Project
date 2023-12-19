require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
     # Test for presence of password and password_confirmation and their match
     it 'validates presence of password and password_confirmation and their match' do
      user = User.new(
        first_name: 'Jo',
        last_name: 'Doe',
        email: 'jo@example.com',
        password: 'password123',
        password_confirmation: 'password123'
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
        password: 'password123',
        password_confirmation: 'password123'
      )
      user_with_duplicate_email = User.new(
        first_name: 'Janet',
        last_name: 'Doe',
        email: 'TEST@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user_with_duplicate_email).to_not be_valid
    end

    # Test for presence of email, first name, and last name
    it 'validates presence of email, first name, and last name' do
      user = User.new(
        email: nil,
        first_name: nil,
        last_name: nil,
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to_not be_valid
    end

    # Test for minimum password length
    it 'does not save with a password shorter than the minimum length' do
      user = User.new(
        first_name: 'Jo',
        last_name: 'Doe',
        email: 'jo@example.com',
        password: '123', 
        password_confirmation: '123'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  # Tests for the custom authentication method in User model
  describe '.authenticate_with_credentials' do
    # Before each test, set up user in the database.
    # This user is used to test the authentication method.
    before(:each) do
      @user = User.create!(
        first_name: 'Jo',
        last_name: 'Doe',
        email: 'example@domain.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    # Test case to verify that a user can be authenticated with correct credentials.
    it 'authenticates correctly with valid credentials' do
      user = User.authenticate_with_credentials('example@domain.com', 'password123')
      expect(user).to eq(@user)
    end

    # Test case to ensure that authentication fails with an incorrect password.
    it 'does not authenticate with incorrect password' do
      user = User.authenticate_with_credentials('example@domain.com', 'wrongpassword')
      expect(user).to be_nil
    end

    # Test case to check that authentication still succeeds even if there are leading and/or trailing spaces in the email address.
    it 'authenticates correctly with whitespace around email' do
      user = User.authenticate_with_credentials('  example@domain.com  ', 'password123')
      # Whitespace should be stripped, allowing successful authentication.
      expect(user).to eq(@user)
    end

    # Test case to verify that email case sensitivity does not prevent authentication.
    it 'authenticates correctly with case-insensitive email' do
      user = User.authenticate_with_credentials('ExAmPlE@DoMaIn.CoM', 'password123')
      # Email case differences should not affect authentication.
      expect(user).to eq(@user)
    end
  end
end

