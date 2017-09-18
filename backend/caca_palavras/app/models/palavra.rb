class Palavra < ActiveRecord::Base
  belongs_to :caca_palavra

  validates :palavra, presence: true

  before_destroy :valida_exclusao

  private

  def valida_exclusao
  	raise 'Não é possível excluir uma palavra do jogo.'
  end
end
