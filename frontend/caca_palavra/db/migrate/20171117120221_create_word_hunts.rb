class CreateWordHunts < ActiveRecord::Migration[5.1]
  def change
    create_table :word_hunts do |t|
      t.string :name
      t.integer :teacher_id
      t.integer :team_id
      t.text :puzzle
    end

    add_index :word_hunts, :teacher_id
    add_index :word_hunts, :team_id
  end
end
