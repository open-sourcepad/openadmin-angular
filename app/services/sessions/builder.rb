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
        access_token: @current_user.access_token
      }
    end

  end


end
