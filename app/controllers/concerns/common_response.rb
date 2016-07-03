module CommonResponse
  extend ActiveSupport::Concern

  included do

    class InvalidCredentialsError < StandardError; end
    rescue_from InvalidCredentialsError do
      render json: { error: 'Invalid Email or Password' }, status: :unauthorized
    end

    #
    # raise an error if:
    # the token is an invalid token
    # either it is an old token
    # or simple the token does not exist
    #
    class ExpiredSessionError < StandardError; end
    rescue_from ExpiredSessionError do
      render json: { error: 'Your session has expired' }, status: :unauthorized # unofficial expired session
    end

    #
    # raise if the user is inactive
    #
    class UserInactiveError < StandardError; end
    rescue_from UserInactiveError do
      render json: { error: 'Your account is inactive' }, status: :unauthorized # unofficial expired session
    end

    #
    # raise if a process is halted
    #
    class ServiceError < StandardError; end
    rescue_from ServiceError do
      render json: {errors: @service.errors}, status: 422
    end

    #
    # Invalid Request
    #
    class InvalidRequestError < StandardError; end
    rescue_from InvalidRequestError do
      render json: {error: "Request is invalid"}, status: 422
    end

  end

  def render_success
    render json: {success: true}
  end

end
