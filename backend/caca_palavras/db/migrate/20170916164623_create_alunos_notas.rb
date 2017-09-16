class CreateAlunosNotas < ActiveRecord::Migration[5.1]
  def change
    create_table :alunos_notas do |t|
    	t.integer :aluno_id
    	t.references :nota
    end
  end
end
