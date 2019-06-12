class User < ActiveRecord::Base
has_secure_password
validates :first_name, presence: true, length: {minimum: 6, maximum: 30}
validates :last_name, presence: true, length: {minimum: 6, maximum: 30}
validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i}
validates :password, presence: true, length: {minimum: 6}
validates :password, confirmation: true

before_save :email_downcase

  def email_downcase
    self.email = email.downcase
  end

end
