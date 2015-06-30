class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content, size: 256

      t.timestamps
    end
  end
end
