class ApiController < ActionController::Base
  include Authenticator
  include MetadataBuilder
  include CommonAction
  include CommonResponse
  
  protect_from_forgery with: :null_session
  before_action :authenticate_request

end
