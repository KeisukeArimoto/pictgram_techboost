class User < ApplicationRecord
  
  
  VALID_EMAIL_REGEX =/\A^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-]).([a-zA-Z0-9\._-]+)+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i

  
  validates :name, presence: true , length: { maximum: 15 }
  validates :email, presence: true , format: {with: VALID_EMAIL_REGEX}
  validates :password, format: {with: VALID_PASSWORD_REGEX}
  
  has_secure_password
end
