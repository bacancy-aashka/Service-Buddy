class AddEmailConfirmedAndConfirmTokenToProviderDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :provider_details, :email_confirmed, :boolean, default: false
    add_column :provider_details, :confirm_token, :string
  end
end
