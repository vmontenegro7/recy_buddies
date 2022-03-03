class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.string :address
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
