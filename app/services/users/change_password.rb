module Users
  class ChangePassword < Base

    def process params
      return false unless validate_password_matching(params)
      if @user.valid_password?(params[:old_password])
        update_password(params[:confirm_password])
      else
        @errors.push "Invalid Old Password"
        return false
      end
    end

  end
end
