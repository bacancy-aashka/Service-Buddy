class CreateProviderRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_requests do |t|
      t.string :status
      t.references :provider, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
