class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.datetime :request_from
      t.datetime :requesst_to
      t.references :skill, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
