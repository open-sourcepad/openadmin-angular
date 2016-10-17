class Api::V1::UsersController < ApiController

  before_action :find_obj, only: [:update,:show,:delete,:update_password,:update_avatar]
  before_action :find_user_by_token, only: [:verify_reset_token,:reset_password]
  skip_before_action :authenticate_request, only: [:create, :forgot_password, :verify_reset_token, :reset_password]

  def initialize
    @perPage = 5
  end

  def index
    setPage(params[:page])

    render_with_meta_data User.conditions(params).limit(@perPage).offset((@page-1)*@perPage), User.conditions(params).count
  end

  def show
    render json: {collection: @obj, image_url: @obj.avatar.url(:thumb)}
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

  def update_avatar
    update_obj
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
      avatar
    ))
  end

  def setPage(page)
    @page = page.to_i
  end

end
