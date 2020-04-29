class ProviderDetailMailer < ApplicationMailer

  def provider_detail_registration_confirmation(provider_detail)
    @provider_detail = provider_detail
    mail to: @provider_detail.provider.user.email, :subject => "Registration Confirmation for new Provider Detail's registration."
  end

end
