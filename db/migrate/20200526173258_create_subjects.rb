class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :day
      t.integer :period
      t.integer :classtime

      t.timestamps
    end
  end
end
