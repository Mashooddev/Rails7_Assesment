class Admin < ApplicationRecord
  has_secure_password

  validates :email,
            uniqueness: true,
            format: { with: EMAIL_REGEX}

  validates :password, length: { minimum: 6 }

  default_scope { order(created_at: :desc) }
end
