class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :current_stock
      t.integer :price
      t.integer :discount
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
