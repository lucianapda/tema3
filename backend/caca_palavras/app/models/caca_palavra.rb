class CacaPalavra < ActiveRecord::Base
  belongs_to :professor, class_name: 'Usuario'
  belongs_to :turma
 
  has_many :palavras, dependent: :destroy
  accepts_nested_attributes_for :palavras, allow_destroy: true

  has_many :notas
 
  validates :nome, presence: true

  before_save :valida_palavras_iguais, :save_caca_palavras
  before_destroy :valida_exclusao

  def registra_nota(aluno_id, palavras_encontradas)
  	aluno = Usuario.find(aluno_id)

  	raise 'Não é possível refazer o exercício' if aluno.notas.where(caca_palavra_id: id).present?

  	palavras_encontradas = palavras.where(palavra: palavras_encontradas)
  	
  	nota_exercicio = 10.0 / palavras.size * palavras_encontradas.size

  	aluno.notas.create(caca_palavra_id: id, nota: nota_exercicio)
  end

  private

  def valida_palavras_iguais
  	return if palavras.map(&:palavra).uniq.size == palavras.map(&:palavra).size
	raise 'Não são permitidas palavras iguais.'  	
  end

  def save_caca_palavras
  	raise 'Não é possível alterar. Alunos já realizaram o exercício.' if notas.present?
  	#https://github.com/jamis/wordsearch/blob/master/bin/wordsearch
  	tamanho = palavras.map(&:palavra).map(&:size).max + 10
  	self.puzzle =  WordSearch::Puzzle.new(palavras.map(&:palavra), rows: tamanho, columns: tamanho).to_s
  end

  def valida_exclusao
  	raise 'Não é possível excluir. Alunos já realizaram o exercício.' if notas.present?
  end
end
