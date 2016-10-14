module CommonAction
  extend ActiveSupport::Concern

  def create_obj
    if @obj.save
      render json: @obj
    else
      obj_errors
    end
  end

  def update_obj
    if @obj.update_attributes(obj_params)
      render json: {success: true}
    else
      obj_errors
    end
  end

  def delete_obj
    if @obj.destroy
      render json: {success: true}
    else
      obj_errors
    end
  end

  def obj_errors obj=nil
    obj ||= @obj
    render json: { message: 'Validation failed', errors: obj.errors.full_messages }, status: 422
  end

end
