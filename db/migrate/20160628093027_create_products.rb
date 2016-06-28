class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :color
      t.integer :cost

      t.timestamps null: false
    end
  end
end
