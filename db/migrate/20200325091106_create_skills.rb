class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
