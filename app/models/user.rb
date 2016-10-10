class User < ApplicationRecord
  include Authenticable
  include TokenProcessor
  include Filterable

  scope :email, -> (email) { where("email ilike ?", "#{email}")}
  scope :firstName, -> (first_name) { where("first_name ilike ?", "#{first_name}")}
  scope :lastName, -> (last_name) { where("last_name ilike ?", "#{last_name}")}
  scope :selectedStatus, -> (is_active) { where("is_active = ?", "#{is_active}") if is_active.present? }
  scope :page, -> (page) { limit(20).offset((page.to_i-1)*20) }

  validates :email, presence: true, email: true
  validate :validate_password_presence
  validate :validate_password_length

  before_destroy :destroy_token

  #
  # Finds a user given email and password
  # note: valid password method is inside authenticable
  #
  def self.find_by_credentials(creds)
    user = self.find_by(email: creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end

  # def self.filter(attributes)
  #   attributes.select{|k,v| v.present?}.map do |scope, (key,value)|
  #     case key.to_sym
  #     when :selectedStatus
  #       scope.where(key => value)
  #     when :email, :firstName, :lastName
  #       scope.where(["#{key} ILIKE ?", "%#{value}%"])
  #     else
  #       scope
  #     end
  #   end
  # end

end
