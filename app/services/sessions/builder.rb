module Sessions
  class Builder

    def initialize current_user
      @current_user = current_user
    end

    #
    # note: only put fields that are neccessary for session request
    #
    def show
      {
        id: @current_user.id,
        email: @current_user.email,
        access_token: @current_user.access_token,
        first_name: @current_user.first_name,
        last_name: @current_user.last_name,
        image_url: @current_user.avatar.url(:thumb)
      }
    end

  end


end
