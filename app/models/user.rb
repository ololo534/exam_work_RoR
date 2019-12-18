class User < ApplicationRecord
  has_secure_password
  validates :name,
            presence: true,
            uniqueness: true,
            format: { with: /\A[a-zA-Z0-9._%+-]+\z/ }
  validates :email,
            presence: true,
            uniqueness: true,
            email_format: { message: 'is not looking good' }
  validates :password_digest,
            presence: true,
            confirmation: true
end
