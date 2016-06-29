class Api::V1::SessionsController < ApiController

  skip_before_action :authenticate_request, only: :create

  def show
    if current_user.present?
      render json: Sessions::Builder.new(current_user).show
    else
      fail ExpiredSessionError
    end
  end

  def create
    user = User.find_by_credentials(params[:credentials])
    if user && user.set_access_token
      render json: Sessions::Builder.new(user).show
    else
      fail InvalidCredentialsError
    end
  end

  def destroy
    if current_user.destroy_token(request.headers['AccessToken'])
      render_success
    else
      obj_errors
    end
  end

end
