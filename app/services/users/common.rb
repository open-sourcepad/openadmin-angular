module Users
  module Common

    private

    def validate_activation_token token
      if token == @user.activation_token
        return true
      else
        @errors.push "Activation Token is Invalid or Expired"
        return false
      end
    end

    def validate_password_matching params
      if params[:new_password] == params[:confirm_password]
        return true
      else
        @errors.push "Passwords do not match"
        return false
      end
    end

  end
end
