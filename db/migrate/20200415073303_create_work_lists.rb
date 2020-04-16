class CreateWorkLists < ActiveRecord::Migration[6.0]
  def change
    create_table :work_lists do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.belongs_to :provider
      t.boolean :status

      t.timestamps
    end
  end
end
