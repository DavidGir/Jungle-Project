class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  # Class method which takes into account edge cases
  def self.authenticate_with_credentials(email, password)
    # email.strip.downcase trims any whitespace and converts the email to lowercase.
    # find_by('LOWER(email) = ?') finds the user in a case-insensitive manner.
    user = User.find_by('LOWER(email) = ?', email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end
