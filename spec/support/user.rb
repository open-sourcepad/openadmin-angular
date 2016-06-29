def current_user
  @user ||= FactoryGirl.create(:user)
end
