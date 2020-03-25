class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :contact
      t.date :dob

      t.timestamps
    end
  end
end
