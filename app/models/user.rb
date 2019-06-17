class User < ActiveRecord::Base
has_secure_password

auto_strip_attributes :email, squish: true
validates :first_name, presence: true, length: {minimum: 6, maximum: 30}
validates :last_name, presence: true, length: {minimum: 6, maximum: 30}
validates :email, presence: true, uniqueness: true, case_sensitive: false, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i}
validates :password, presence: true, length: {minimum: 6}
validates :password_confirmation, presence: true
validates :password, confirmation: true

before_save :email_downcase

  def email_downcase
    self.email = email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    user = User.find_by email: email
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


end

