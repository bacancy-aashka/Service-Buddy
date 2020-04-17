class DailyAppointmentsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_appointments_mailer.mail_to_providers.subject
  #
  def mail_to_providers(user)
    mail to: user.email, subject: 'Your today\'s appointments.'
  end
end
