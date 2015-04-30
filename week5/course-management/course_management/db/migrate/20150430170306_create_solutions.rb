class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string      :content
      t.references  :task, index: true

      t.timestamps
    end
  end
end
