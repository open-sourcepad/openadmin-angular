class Api::V1::UsersController < ApiController

  before_filter :find_obj, only: [:update,:show,:delete]
  before_filter :find_user_by_token, only: [:verify_reset_token,:reset_password]
  skip_before_action :authenticate_request, only: :create 

  def index
    render_with_meta_data User.filter(filter_params).order(:email),getCount
  end

  def show
    binding.pry
    render json: @obj
  end

  def create
    @obj = User.new(obj_params)
    create_obj
  end

  def update
    update_obj
  end

  def destroy
    find_obj
    delete_obj
  end

  def update_password
    @service = Users::ChangePassword.new(@obj)
    if @service.process(params)
      render_success
    else
      fail ServiceError
    end
  end

  def verify_reset_token
    if @obj.present?
      render_success
    else
      fail InvalidTokenError
    end
  end

  def reset_password
    @service = Users::ForgotPassword.new(@obj)
    if @service.process(params)
      render_success
    else
      fail ServiceError
    end
  end

  def forgot_password
    @obj = User.find_by(email: params[:email])
    @service = Users::ForgotPassword.new(@obj)
    if @service.send_reset_token
      render_success
    else
      fail ServiceError
    end
  end

  def update_password
    @service = Users::ChangePassword.new(@obj)
    if @service.process(params)
      render_success
    else
      fail ServiceError
    end
  end

  private

  def find_user_by_token
    @obj = User.find_by(reset_password_token: params[:token])
  end

  def find_obj
    @obj = User.find(params[:id])
  end

  def obj_params
    params.require(:user).permit(*%i(
      first_name
      last_name
      address
      city
      zip
      state
      email
      password
      is_active
    ))
  end

  def filter_params
    params.slice(
      :email,
      :firstName,
      :lastName,
      :selectedStatus,
      :page
    )
  end

  def count_params
    params.slice(
      :email,
      :firstName,
      :lastName,
      :selectedStatus,
    )
  end

  def getCount
    if isFilter()
      User.filter(count_params).count
    else
      User.count
    end
  end

  def isFilter
    params[:email].present? ||
    params[:firstNamee].present? ||
    params[:lastName].present? ||
    params[:selectedStatus].present?
  end
end
