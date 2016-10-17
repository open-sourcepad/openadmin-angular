module TokenProcessor
  extend ActiveSupport::Concern

  def set_access_token
    self.update_attribute(:access_token, SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz'))
  end

  def destroy_token
    self.update_attributes(access_token: nil)
  end

  def set_reset_password_token
    self.update_attribute(:reset_password_token, SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz'))
  end

end
