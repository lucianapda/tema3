class CacaPalavra < ActiveRecord::Base
  belongs_to :professor, class_name: 'Usuario'
  belongs_to :turma
 
  has_many :palavras, dependent: :destroy
  accepts_nested_attributes_for :palavras, allow_destroy: true

  has_many :notas
 
  validates :nome, presence: true

  #before_create :create_caca_palavras
  before_save :valida_palavras_iguais

  private

  def valida_palavras_iguais
  	return if palavras.map(&:palavra).uniq.size == palavras.map(&:palavra).size
	raise 'Não são permitidas palavras iguais.'  	
  end

  def create_caca_palavras
  	#https://github.com/jamis/wordsearch/blob/master/bin/wordsearch
  	WordSearch::Puzzle.new(palavras.map(&:palavra))
  end
end
