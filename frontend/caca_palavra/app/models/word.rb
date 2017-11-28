class Word < ActiveRecord::Base
  belongs_to :word_hunt

  validates :word, presence: true

  # before_destroy :allow_destroy?

  private

  def allow_destroy?
    raise 'Não é possível excluir uma palavra do jogo.'
  end
end
