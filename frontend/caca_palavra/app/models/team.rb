class Team < ActiveRecord::Base
  has_many :students_teams
  has_many :students, through: :students_teams

  has_many :word_hunts

  # before_destroy :allow_destroy?

  validates :name, presence: true

  private

  def allow_destroy?
    return true if students.blank?

    raise 'Não é possível excluir uma turma com alunos associados.'
  end
end
