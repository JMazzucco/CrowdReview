class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def welcome_email(user)
  	@user = User.find(user.id)
    @url  = 'http://localhost:3000/login'
    mail(:to => user.email,
         :subject => "Thanks for signing up to CrowdFunder!")
  end

	def reset_password_email(user)
	  @user = User.find(user.id)
	  @url  = edit_password_reset_url(@user.reset_password_token)
	  mail(:to => user.email,
	       :subject => "Your password has been reset")
	end
end
