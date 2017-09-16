class Turma < ActiveRecord::Base
  has_many :alunos, foreign_key: 'aluno_id', class_name: 'Usuario'

  has_many :alunos_turmas, foreign_key: 'aluno_id', class_name: 'AlunoTurma'
  has_many :alunos, through: :alunos_turmas

  validates :nome, presence: true 
end
