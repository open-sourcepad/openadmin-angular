class Api::V1::UsersController < ApiController

  before_filter :find_obj, only: [:update,:show,:delete]

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
  
  def delete
    delete_obj
  end

  private

  def obj_params
    params.require(:user).permit(*%i(
      name
      email
    ))
  end


end
