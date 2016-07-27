class Staff < ApplicationRecord
  #downcases all email entries to facilitate uniqueness validation
  before_save { email.downcase! }

  #VALIDATIONS
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: { maximum: 50, message: 'Your name is too long.' }

  validates :email,
            presence: true,
            length: { maximum: 50, message: 'Your email is too long.' },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  #For hashing password
  # has_secure_password
end
