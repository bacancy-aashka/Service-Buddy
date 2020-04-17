# Preview all emails at http://localhost:3000/rails/mailers/daily_appointments_mailer
class DailyAppointmentsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/daily_appointments_mailer/mail_to_providers
  def mail_to_providers
    DailyAppointmentsMailer.mail_to_providers
  end

end
