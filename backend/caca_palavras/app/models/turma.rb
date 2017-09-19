class Turma < ActiveRecord::Base
  has_many :alunos_turmas
  has_many :alunos, through: :alunos_turmas

  has_many :caca_palavras

  before_destroy :valida_exclusao

  validates :nome, presence: true

  private

  def valida_exclusao
    return true if alunos.blank?

    raise 'Não é possível excluir uma turma com alunos associados.'
  end
end
