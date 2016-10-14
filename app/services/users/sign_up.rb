module Users
  class SignUp < Base

    def process
      return false if !validate_user_existence || validate_user_active || validate_blank_password
      @user.update_attribute(:is_active, true)
    end

    def validate_user_existence
      if @user.nil?
        @errors.push "User not found, invalid token!"
        return false
      end
      return true
    end

    def validate_user_active
      if @user.is_active == true
        @errors.push "Account is already active!"
        return true
      end
      return false
    end

    def validate_blank_password
      if @user.encrypted_password.blank?
        @errors.push "Please complete registration!"
        return true
      end
      return false
    end

  end
end
