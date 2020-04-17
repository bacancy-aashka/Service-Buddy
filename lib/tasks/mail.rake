namespace :mail do
  desc "TODO"
  task daily_appointments_mail: :environment do

    Provider.mail_for_today
    puts "Hello Providers"
  end

end
