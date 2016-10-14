module Users
  class ChangePassword < Base

    def process params
      return false unless validate_password_matching(params)
      if @user.valid_password?(params[:old_password])
        @user.password = params[:confirm_password]
        @user.save()
        return true
      else
        @errors.push "Invalid Old Password"
        return false
      end
    end

  end
end
