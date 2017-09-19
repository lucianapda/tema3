class Turma < ActiveRecord::Base
  has_many :alunos_turmas
  has_many :alunos, through: :alunos_turmas

  has_many :caca_palavras

  validates :nome, presence: true 
end
