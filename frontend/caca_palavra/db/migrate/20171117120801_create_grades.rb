class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :word_hunt_id
      t.integer :student_id
      t.decimal :grade, precision: 4, scale: 2
    end

    add_index :grades, :word_hunt_id
    add_index :grades, :student_id
  end
end
