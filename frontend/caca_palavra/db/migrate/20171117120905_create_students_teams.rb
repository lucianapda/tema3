class CreateStudentsTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :students_teams do |t|
      t.integer :student_id
      t.integer :team_id
    end

    add_index :students_teams, :student_id
    add_index :students_teams, :team_id
  end
end
