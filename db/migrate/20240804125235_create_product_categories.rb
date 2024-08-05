class CreateProductCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.integer :products_count
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
