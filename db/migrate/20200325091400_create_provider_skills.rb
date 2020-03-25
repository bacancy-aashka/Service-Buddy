class CreateProviderSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :provider_skills do |t|
      t.integer :experience
      t.integer :charges
      t.boolean :avail
      t.references :skill, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
