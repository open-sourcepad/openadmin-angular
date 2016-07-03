module Users
  class ForgotPassword < Base

    def process params
      return false unless validate_password_matching(params)
      if @user.update_attributes(password: params[:new_password], reset_password_token: nil)
        return true
      else
        @errors.push "Invalid Old Password"
        return false
      end
    end

    def send_reset_token email
      unless @user.present?
        @errors.push "User with email not found"
        return false
      end

      if @user.set_reset_password_token
        return true
      else
        @errors = @users.errrs.full_messages
        return false
      end
    end

  end
end
