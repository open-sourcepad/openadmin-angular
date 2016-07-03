class Api::V1::UsersController < ApiController

  before_filter :find_obj, only: [:update,:show,:delete]
  before_filter :find_user_by_token, only: [:verify_reset_token,:reset_password]


  def index
    render_with_meta_data User.all,User.count
  end

  def show
    render json: @obj
  end

  def create
    @obj = User.new(obj_params)
    create_obj
  end

  def update
    update_obj
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
    ))
  end


end
