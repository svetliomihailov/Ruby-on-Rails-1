class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :text, size: 40
  end
end
