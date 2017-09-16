class CreateAlunosTurmas < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos_turmas do |t|
    	t.integer :aluno_id
    	t.references :turma
    end
  end
end
