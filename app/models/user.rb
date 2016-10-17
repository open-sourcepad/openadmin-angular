class User < ApplicationRecord
  include Authenticable
  include TokenProcessor
  include Filterable

  validates :email, presence: true, email: true
  validate :validate_password_presence
  validate :validate_password_length
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_destroy :destroy_token

  #
  # Finds a user given email and password
  # note: valid password method is inside authenticable
  #
  def self.find_by_credentials(creds)
    user = self.find_by(email: creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end

  def self.conditions(params)
    # query = "email ilike '%#{params[:email]}%'
    #   AND first_name ilike '%#{params[:first_name]}%'
    #   AND last_name ilike '%#{params[:last_name]}%'"
    # unless params[:is_active].blank?
    #   query << " AND is_active = #{params[:is_active]}"
    # end
    self.where(filter(params))
  end

  def self.orderBy(params)
    sort = params[:direction] == 'true' ? 'DESC' : 'ASC'
    unless params[:orderby].blank?
      self.order("#{params[:orderby]} #{sort}")
    end
  end


end
