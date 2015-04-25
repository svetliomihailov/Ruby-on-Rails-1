class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title, size: 40, null: false
      t.string :url, size: 256, null: false

      t.timestamps
    end
  end
end
