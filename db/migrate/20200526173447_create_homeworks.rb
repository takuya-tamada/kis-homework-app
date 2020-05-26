class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.integer :subject_id
      t.string :name
      t.date :due
      t.string :else

      t.timestamps
    end
  end
end
