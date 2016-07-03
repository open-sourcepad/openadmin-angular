class User < ApplicationRecord
  include Authenticable
  include TokenProcessor

  validates :email, presence: true, email: true
  validate :validate_password_presence
  validate :validate_password_length

  after_destroy :destroy_token

  #
  # Finds a user given email and password
  # note: valid password method is inside authenticable
  #
  def self.find_by_credentials(creds)
    user = self.find_by(email: creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end


end
