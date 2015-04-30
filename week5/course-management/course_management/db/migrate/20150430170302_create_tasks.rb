class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string      :name, size: 255
      t.string      :description
      t.references  :lecture, index: true

      t.timestamps
    end
  end
end
