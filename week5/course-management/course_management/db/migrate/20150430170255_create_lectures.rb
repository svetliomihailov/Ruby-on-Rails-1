class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string   :name, size: 255
      t.string   :body      

      t.timestamps
    end
  end
end
