class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.references :request, null: false, foreign_key: true
      t.string :method
      t.float :tax
      t.float :amount
      t.float :provider_charge
      t.float :total

      t.timestamps
    end
  end
end
