class UserMailer < ActionMailer::Base
  layout 'mailer'

  def forgot_password user_id
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Forgot password stuff", from: 's3premium999@gmail.com')
  end

end
