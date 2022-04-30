class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.integer :rate
      t.text :memo

      t.timestamps
    end
  end
end
