class Usuario < ActiveRecord::Base
  extend Enumerize

  has_many :notas, foreign_key: 'aluno_id'

  has_many :alunos_turmas, foreign_key: 'aluno_id'
  has_many :turmas, through: :alunos_turmas

  has_many :caca_palavras, foreign_key: 'professor_id', class_name: 'Usuario'

  enumerize :tipo, in: { :professor => 1, :aluno => 2 }, predicates: { prefix: true }

  validates :nome, :email, :tipo, presence: true 
end
