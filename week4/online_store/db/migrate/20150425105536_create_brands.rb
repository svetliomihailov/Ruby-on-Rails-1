class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string    :name, size: 40
      t.string    :description, size: 140

      t.timestamps null: false
    end
  end
end
