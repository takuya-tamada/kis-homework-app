class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
