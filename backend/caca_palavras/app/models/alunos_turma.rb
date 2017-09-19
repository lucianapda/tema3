class AlunosTurma < ActiveRecord::Base
  belongs_to :aluno, class_name: 'Usuario'
  belongs_to :turma
end
