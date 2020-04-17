module UsersHelper

  def only_confirmed_provider_details(user)
    user.provider.provider_details.where(email_confirmed: true)
  end

end
