class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string     :name, size: 40
      t.decimal    :price, precision: 10, scale: 2
      t.integer    :quantity
      t.references :brand, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
