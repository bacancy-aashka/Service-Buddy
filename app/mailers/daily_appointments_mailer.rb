class DailyAppointmentsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  # en.daily_appointments_mailer.mail_to_providers.subject

  def mail_to_providers(providers)
    providers.each do |provider|
      if provider.work_lists.present?
      @work_lists = provider.work_lists.where(date: Date.today)
        @work_lists.each do |list|
          puts "#{list.provider.user.email} #{list.title} #{list.description}"
        end
      # mail to: provider.user.email, subject: 'Your today\'s appointments.'
      end
    end
  end

end
