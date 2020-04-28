class Provider < ApplicationRecord

  belongs_to :user
  has_many :provider_details, dependent: :destroy
  has_many :work_lists

  def self.mail_for_today
    providers = Provider.all
    DailyAppointmentsMailer.mail_to_providers(providers).deliver_now
  end
  
end
