class CreatePickUps < ActiveRecord::Migration[6.1]
  def change
    create_table :pick_ups do |t|
      t.references :package, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
