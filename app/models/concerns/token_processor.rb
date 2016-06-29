module TokenProcessor
  extend ActiveSupport::Concern

  def set_access_token
    self.update_attribute(:access_token, SecureRandom.urlsafe_base64(32).tr('lIO0', 'sxyz'))
  end

  def destroy_token
    self.update_attribute(:access_token, nil)
  end

end
